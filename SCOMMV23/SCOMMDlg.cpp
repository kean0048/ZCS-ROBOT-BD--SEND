// SCOMMDlg.cpp : implementation file
//

#include "stdafx.h"
#include "SCOMM.h"
#include "SCOMMDlg.h"
#include "io.h"
#include "math.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define BufSize 512

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About


class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	CHyperLink	m_ctrlHyperLinkWWWXFS;
	CHyperLink	m_ctrlHyperLink1;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//DDX_Control(pDX, IDC_STATIC_WWWXFS, m_ctrlHyperLinkWWWXFS);
	//DDX_Control(pDX, IDC_STATIC_MAILXFS1, m_ctrlHyperLink1);
	//}}AFX_DATA_MAP
}

BOOL CAboutDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	//m_ctrlHyperLink1.SetURL(_T("mailto:webmaster@gjwtech.com"));
	//m_ctrlHyperLink1.SetUnderline(TRUE);
	//m_ctrlHyperLink1.SetLinkCursor(AfxGetApp()->LoadCursor(IDC_CURSOR_HAND));

	//m_ctrlHyperLinkWWWXFS.SetURL(_T("http://www.gjwtech.com"));
	//m_ctrlHyperLinkWWWXFS.SetUnderline(TRUE);
	//m_ctrlHyperLinkWWWXFS.SetLinkCursor(AfxGetApp()->LoadCursor(IDC_CURSOR_HAND));
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSCOMMDlg dialog

CSCOMMDlg::CSCOMMDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSCOMMDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSCOMMDlg)
	m_ReceiveData = _T("");
	m_strSendData = _T("");
	m_strCurPath = _T("");
	m_strSendFilePathName = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

	m_bAutoSend=FALSE;
	m_bVisible=FALSE;
	m_bSendFile=FALSE;
	m_bStopDispRXData=FALSE;
	m_bOpenPort=FALSE;
	m_nCycleTime=1000;
	m_strCurPath="C:\\COMDATA";
	m_strSendFilePathName="还没有选择文件";//"No File Selected!";
	m_nFileLength=0;

}


void CSCOMMDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSCOMMDlg)
	DDX_Control(pDX, IDC_BUTTON_HELP, m_ctrlHelp);
	DDX_Control(pDX, IDC_BUTTON_PUSHPIN, m_ctrlPushPin);
	DDX_Control(pDX, IDC_BUTTON_SENDFILE, m_ctrlSendFile);
	DDX_Control(pDX, IDC_EDIT_SENDFILE, m_ctrlEditSendFile);
	DDX_Control(pDX, IDC_STATIC_TXCOUNT, m_ctrlTXCount);
	DDX_Control(pDX, IDC_STATIC_STATUS, m_ctrlPortStatus);
	DDX_Control(pDX, IDC_STATIC_RXCOUNT, m_ctrlRXCOUNT);
	DDX_Control(pDX, IDC_EDIT_SAVEPATH, m_ctrlSavePath);
	DDX_Control(pDX, IDC_BUTTON_MANUALSEND, m_ctrlManualSend);
	//DDX_Control(pDX, IDC_STATIC_GJW, m_ctrlHyperLink2);
	DDX_Control(pDX, IDC_BUTTON_CLEARRECASENDA, m_ctrlClearTXData);
	//DDX_Control(pDX, IDC_STATIC_XFS, m_ctrlStaticXFS);
	DDX_Control(pDX, IDC_BUTTON_CLOSE, m_ctrlClose);
	DDX_Control(pDX, IDC_BUTTON_COUNTRESET, m_ctrlCounterReset);
	DDX_Control(pDX, IDC_EDIT_SEND, m_ctrlEditSend);
	DDX_Control(pDX, IDC_EDIT_RECIVE, m_ctrlReceiveData);
	DDX_Control(pDX, IDC_CHECK_AUTOCLEAR, m_ctrlAutoClear);
	DDX_Control(pDX, IDC_STATIC_OPENOFF, m_ctrlIconOpenoff);
	//DDX_Control(pDX, IDC_STATIC_XFS2, m_ctrlHyperLinkWWW);
	DDX_Control(pDX, IDC_COMBO_STOPBITS, m_StopBits);
	DDX_Control(pDX, IDC_COMBO_DATABITS, m_DataBits);
	DDX_Control(pDX, IDC_COMBO_PARITY, m_Parity);
	DDX_Control(pDX, IDC_CHECK_AUTOSEND, m_ctrlAutoSend);
	DDX_Control(pDX, IDC_CHECK_HEXSEND, m_ctrlHexSend);
	DDX_Control(pDX, IDC_BUTTON_STOPDISP, m_ctrlStopDisp);
	DDX_Control(pDX, IDC_BUTTON_OPENPORT, m_ctrlOpenPort);
	DDX_Control(pDX, IDC_CHECK_HEXRECIEVE, m_ctrlHexReceieve);
	DDX_Control(pDX, IDC_COMBO_SPEED, m_Speed);
	DDX_Control(pDX, IDC_COMBO_COMSELECT, m_Com);
	DDX_Text(pDX, IDC_EDIT_RECIVE, m_ReceiveData);
	DDX_Text(pDX, IDC_EDIT_SEND, m_strSendData);
	DDX_Text(pDX, IDC_EDIT_SAVEPATH, m_strCurPath);
	DDV_MaxChars(pDX, m_strCurPath, 200);
	DDX_Text(pDX, IDC_EDIT_SENDFILE, m_strSendFilePathName);
	DDV_MaxChars(pDX, m_strSendFilePathName, 200);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CSCOMMDlg, CDialog)
	//{{AFX_MSG_MAP(CSCOMMDlg)
	ON_MESSAGE(WM_COMM_RXCHAR, OnCommunication)
	ON_MESSAGE(WM_COMM_TXEMPTY_DETECTED, OnFileSendingEnded)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_CLEAR_RECI_AREA, OnButtonClearReciArea)
	ON_BN_CLICKED(IDC_BUTTON_OPENPORT, OnButtonOpenport)
	ON_BN_CLICKED(IDC_BUTTON_STOPDISP, OnButtonStopdisp)
	ON_BN_CLICKED(IDC_BUTTON_MANUALSEND, OnButtonManualsend)
	ON_BN_CLICKED(IDC_CHECK_AUTOSEND, OnCheckAutosend)
	ON_WM_TIMER()
	ON_EN_CHANGE(IDC_EDIT_CYCLETIME, OnChangeEditCycletime)
	ON_EN_CHANGE(IDC_EDIT_SEND, OnChangeEditSend)
	ON_BN_CLICKED(IDC_BUTTON_CLEARRECASENDA, OnButtonClearrecasenda)
	ON_CBN_SELENDOK(IDC_COMBO_COMSELECT, OnSelendokComboComselect)
	ON_CBN_SELENDOK(IDC_COMBO_SPEED, OnSelendokComboSpeed)
	ON_CBN_SELENDOK(IDC_COMBO_PARITY, OnSelendokComboParity)
	ON_CBN_SELENDOK(IDC_COMBO_DATABITS, OnSelendokComboDatabits)
	ON_CBN_SELENDOK(IDC_COMBO_STOPBITS, OnSelendokComboStopbits)
	ON_BN_CLICKED(IDC_BUTTON_SAVEDATA, OnButtonSavedata)
	ON_BN_CLICKED(IDC_BUTTON_DIRBROWSER, OnButtonDirbrowser)
	ON_BN_CLICKED(IDC_BUTTON_SENDFILE, OnButtonSendfile)
	ON_BN_CLICKED(IDC_BUTTON_COUNTRESET, OnButtonCountreset)
	ON_BN_CLICKED(IDC_BUTTON_CLOSE, OnButtonClose)
	ON_BN_CLICKED(IDC_BUTTON_FILEBROWSER, OnButtonFilebrowser)
	ON_BN_CLICKED(IDC_BUTTON_PUSHPIN, OnButtonPushpin)
	ON_WM_DESTROY()
	ON_BN_CLICKED(IDC_BUTTON_HELP, OnButtonHelp)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()
/*
BEGIN_DYNAMIC_MAP(CSCOMMDlg,CDialog)
	DYNAMIC_MAP_ENTRY(IDC_STATIC_SENDCHAR,   mdNone, mdRepos)
	DYNAMIC_MAP_ENTRY(IDC_CHECK_HEXSEND,     mdNone, mdRepos)
	//DYNAMIC_MAP_ENTRY(IDC_BUTTON_MANUALSEND, mdNone, mdRepos)
	//DYNAMIC_MAP_ENTRY(IDC_CHECK_AUTOSEND,    mdNone, mdRepos)
	DYNAMIC_MAP_ENTRY(IDC_STATIC_CYCLETIME,  mdNone, mdRepos)
	DYNAMIC_MAP_ENTRY(IDC_EDIT_CYCLETIME,    mdNone, mdRepos)
	DYNAMIC_MAP_ENTRY(IDC_STATIC_MS,         mdNone, mdRepos)
	DYNAMIC_MAP_ENTRY(IDC_BUTTON_FILEBROWSER,mdNone, mdRepos)
	DYNAMIC_MAP_ENTRY(IDC_EDIT_SENDFILE,     mdNone, mdRepos)
	DYNAMIC_MAP_ENTRY(IDC_BUTTON_SENDFILE,   mdNone, mdRepos)
	DYNAMIC_MAP_ENTRY(IDC_STATIC_GJW,        mdRepos, mdRepos)

//	DYNAMIC_MAP_ENTRY(IDC_PROGRESS,          mdResize, mdRepos)
//	DYNAMIC_MAP_ENTRY(IDC_STATIC_GJW,        mdRepos, mdRepos)

END_DYNAMIC_MAP()
*/
/////////////////////////////////////////////////////////////////////////////
// CSCOMMDlg message handlers

BOOL CSCOMMDlg::OnInitDialog()//控件的初始化都放在这个里面的
{
	//CDialog::OnInitDialog();
	//BOOL b = CDialog::OnInitDialog(0,fdAll,true); 
    BOOL b = CDialog::OnInitDialog(); 
	// Add "About..." menu item to system menu.
	OnGetPort(&m_Com);
	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here

	//m_ctrlHyperLink2.SetURL(_T("mailto:webmaster@gjwtech.com"));
	//m_ctrlHyperLink2.SetUnderline(TRUE);
	//m_ctrlHyperLink2.SetLinkCursor(AfxGetApp()->LoadCursor(IDC_CURSOR_HAND));//??????????????????????

	//m_ctrlHyperLinkWWW.SetURL(_T("http://www.gjwtech.com"));
	//m_ctrlHyperLinkWWW.SetUnderline(TRUE);
	//m_ctrlHyperLinkWWW.SetLinkCursor(AfxGetApp()->LoadCursor(IDC_CURSOR_HAND));//???????????????????????????????
	

	m_Com.SetCurSel(0);
	m_Speed.SetCurSel(1);
	m_Parity.SetCurSel(0);
	m_DataBits.SetCurSel(0);
	m_StopBits.SetCurSel(0);

	m_hIconRed  = AfxGetApp()->LoadIcon(IDI_ICON_RED);//////////////////////////?加载图标
	m_hIconOff	= AfxGetApp()->LoadIcon(IDI_ICON_OFF);
	m_hIconGreen= AfxGetApp()->LoadIcon(IDI_ICON_GREEN);

//	m_ctrlIconDatareceive.SetIcon(m_hIconOff);
	CString str;
	m_Com.GetLBText(m_Com.GetCurSel(),str);
	str.Remove('C');
	str.Remove('O');
	str.Remove('M');
	m_nCom = atoi(str); 

	m_nBaud = 115200;
	//m_nCom=1;
	m_cParity='N';
	m_nDatabits=8;
	m_nStopbits=1;
	m_dwCommEvents = EV_RXFLAG | EV_RXCHAR;
	//if (m_Port.InitPort(this, 1, 9600,'N',8,1,dwCommEvents,512))
	CString strStatus;
	if (m_Port.InitPort(this, m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits,m_dwCommEvents,512))
	{
		m_Port.StartMonitoring();
		strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		m_ctrlIconOpenoff.SetIcon(m_hIconRed);
		//m_ctrlIconOpenoff.SetIcon(m_hIconOff);

		//"当前状态：串口打开，无奇偶校验，8数据位，1停止位");
	}
	else
	{
		AfxMessageBox("没有发现此串口");
		m_ctrlIconOpenoff.SetIcon(m_hIconOff);
	}
	m_ctrlPortStatus.SetWindowText(strStatus);

	CEdit* pEdit=(CEdit*)GetDlgItem(IDC_EDIT_CYCLETIME);
	CString strText;
	strText.Format("%d",m_nCycleTime);
	pEdit->SetWindowText(strText);   //Display cycle time

	m_strSendData="CK-TEST";
	char cr=13,lf=10;
	m_strSendData += cr;
	m_strSendData += lf;

	m_ctrlAutoClear.SetCheck(1);
	m_ctrlEditSendFile.SetWindowText("No File Selected!");

	m_animIcon.SetImageList(IDB_ANIM_IMGLIST,4,RGB(0,0,0));   
	SetTimer(4,200,NULL);   

	UpdateData(FALSE);


	ShowWindow(SW_SHOW); 
//	return TRUE;  // return TRUE  unless you set the focus to a control
	return b;
}

void CSCOMMDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CSCOMMDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CSCOMMDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

static long rxdatacount=0;  //该变量用于接收字符计数
LONG CSCOMMDlg::OnCommunication(WPARAM ch, LPARAM port)
{
	if (port <= 0 || port > 4)
		return -1;
	rxdatacount++;   //接收的字节计数
	CString strTemp;
	strTemp.Format("%ld",rxdatacount);
	strTemp="RX:"+strTemp;
	m_ctrlRXCOUNT.SetWindowText(strTemp);  //显示接收计数
	
	if(m_bStopDispRXData)   //如果选择了“停止显示”接收数据，则返回
		return -1;          //注意，这种情况下，计数仍在继续，只是不显示
	//若设置了“自动清空”，则达到50行后，自动清空接收编辑框中显示的数据
	if((m_ctrlAutoClear.GetCheck())&&(m_ctrlReceiveData.GetLineCount()>=50))
	{
		m_ReceiveData.Empty();
		UpdateData(FALSE);
	}
	//如果没有“自动清空”，数据行达到400后，也自动清空
	//因为数据过多，影响接收速度，显示是最费CPU时间的操作
	if(m_ctrlReceiveData.GetLineCount()>400)
	{
		m_ReceiveData.Empty();
		m_ReceiveData="***The Length of the Text is too long, Emptied Automaticly!!!***\r\n";        
		UpdateData(FALSE);
	}

	//如果选择了"十六进制显示"，则显示十六进制值
	CString str;
	if(m_ctrlHexReceieve.GetCheck())
		str.Format("%02X ",ch);
	else 
		str.Format("%c",ch);
	//以下是将接收的字符加在字符串的最后，这里费时很多
	//但考虑到数据需要保存成文件，所以没有用List Control
	int nLen=m_ctrlReceiveData.GetWindowTextLength();
	m_ctrlReceiveData.SetSel(nLen, nLen);
	m_ctrlReceiveData.ReplaceSel(str);
	nLen+=str.GetLength();

	m_ReceiveData+=str;
	return 0;
}

//清空接收区
void CSCOMMDlg::OnButtonClearReciArea() 
{
	// TODO: Add your control notification handler code here
	m_ReceiveData.Empty();
	UpdateData(FALSE);
}

//打开/关闭串口
void CSCOMMDlg::OnButtonOpenport() 
{
	// TODO: Add your control notification handler code here
	m_bOpenPort=!m_bOpenPort;
	if(m_bOpenPort)  //关闭串口
	{
		if(m_ctrlAutoSend.GetCheck())
		{
			m_bOpenPort=!m_bOpenPort;
			AfxMessageBox("请先关掉自动发送");
			return;
		}

		m_ctrlOpenPort.SetWindowText("打开串口");
		m_Port.ClosePort();//关闭串口
		m_ctrlPortStatus.SetWindowText("STATUS：COM Port Closed");
		m_ctrlIconOpenoff.SetIcon(m_hIconOff);
	}
	else  //打开串口
	{
		m_ctrlOpenPort.SetWindowText("关闭串口");
		
		CString strStatus;
		if (m_Port.InitPort(this, m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits,m_dwCommEvents,1024))
		{
			m_Port.StartMonitoring();
			m_ctrlIconOpenoff.SetIcon(m_hIconRed);
			strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
			//"当前状态：串口打开，无奇偶校验，8数据位，1停止位");
		}
		else
		{
			AfxMessageBox("没有发现此串口或被占用");
			m_ctrlIconOpenoff.SetIcon(m_hIconOff);
		}
		m_ctrlPortStatus.SetWindowText(strStatus);
	}
}


//停止/继续显示接收数据
void CSCOMMDlg::OnButtonStopdisp() 
{
	// TODO: Add your control notification handler code here
	m_bStopDispRXData=!m_bStopDispRXData;
	if(m_bStopDispRXData)
		m_ctrlStopDisp.SetWindowText("继续显示");
	else
		m_ctrlStopDisp.SetWindowText("停止显示");
}


char CSCOMMDlg::HexChar(char c)
{
	if((c>='0')&&(c<='9'))
		return c-0x30;
	else if((c>='A')&&(c<='F'))
		return c-'A'+10;
	else if((c>='a')&&(c<='f'))
		return c-'a'+10;
	else 
		return 0x10;
}


//将一个字符串作为十六进制串转化为一个字节数组，字节间可用空格分隔，
//返回转换后的字节数组长度，同时字节数组长度自动设置。
int CSCOMMDlg::Str2Hex(CString str, char* data)
{
	int t,t1;
	int rlen=0,len=str.GetLength();
	//data.SetSize(len/2);
	for(int i=0;i<len;)
	{
		char l,h=str[i];
		if(h==' ')//如果有空格
		{
			i++;
			continue;
		}
		i++;
		if(i>=len)
			break;
		l=str[i];
		t=HexChar(h);
		t1=HexChar(l);
		if((t==16)||(t1==16))
			break;
		else 
			t=t*16+t1;
		i++;
		data[rlen]=(char)t;
		rlen++;
	}
	return rlen;

}

long TX_count=0;
void CSCOMMDlg::OnButtonManualsend() 
{
	// TODO: Add your control notification handler code here
	if(m_Port.m_hComm==NULL)
	{
		m_ctrlAutoSend.SetCheck(0);
		AfxMessageBox("串口没有打开，请打开串口");
		return;
	}
	else
	{
		UpdateData(TRUE);
		
		if(m_ctrlHexSend.GetCheck())
		{
			char data[512];
			int len=Str2Hex(m_strSendData,data);
			m_Port.WriteToPort(data,len);
			TX_count+=(long)((m_strSendData.GetLength()+1)/3);
			//m_Port.WriteToPort(hexdata);	
		}
		else 
		{
			m_Port.WriteToPort((LPCTSTR)m_strSendData);	//发送数据
			TX_count+=m_strSendData.GetLength();
		}
		CString strTemp;
		strTemp.Format("TX:%d",TX_count);
		m_ctrlTXCount.SetWindowText(strTemp);
	}
}

void CSCOMMDlg::OnCheckAutosend() 
{
	// TODO: Add your control notification handler code here
	m_bAutoSend=!m_bAutoSend;
	if(m_bAutoSend)
	{
		if(m_Port.m_hComm==NULL)
		{
			m_bAutoSend=!m_bAutoSend;
			m_ctrlAutoSend.SetCheck(0);
			AfxMessageBox("串口没有打开，请打开串口");
			return;
		}
		else
			SetTimer(1,m_nCycleTime,NULL);
	}
	else
	{
		KillTimer(1);
	}

}

void CSCOMMDlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CString strStatus;
	switch(nIDEvent)
	{
	case 1:
		OnButtonManualsend();
		break;
	case 2:
		m_ctrlSavePath.SetWindowText(m_strCurPath);
		KillTimer(2);
		break;
	case 3:
		m_ctrlManualSend.EnableWindow(TRUE);
		m_ctrlAutoSend.EnableWindow(TRUE);
		m_ctrlSendFile.EnableWindow(TRUE);
		m_strSendFilePathName=m_strTempSendFilePathName;
		m_ctrlEditSendFile.SetWindowText(m_strSendFilePathName);//m_strSendFilePathName
		KillTimer(3);

		if(!(m_ctrlAutoSend.GetCheck()))
		{
			if (m_Port.InitPort(this, m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits,m_dwCommEvents,512))
			{
				m_Port.StartMonitoring();
				strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
				m_ctrlIconOpenoff.SetIcon(m_hIconRed);
			}
			else
			{
				AfxMessageBox("Failed to reset send buffer size!");
				m_ctrlIconOpenoff.SetIcon(m_hIconOff);
			}
			m_ctrlPortStatus.SetWindowText(strStatus);
		}
		break;
	case 4:
		m_animIcon.ShowNextImage();
		break;
	default:
		break;
	}

	CDialog::OnTimer(nIDEvent);
}

void CSCOMMDlg::OnChangeEditCycletime() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.
	
	// TODO: Add your control notification handler code here
	CEdit* pEdit=(CEdit*)GetDlgItem(IDC_EDIT_CYCLETIME);
	CString strText;
	pEdit->GetWindowText(strText);
	m_nCycleTime=atoi(strText);
}

void CSCOMMDlg::OnChangeEditSend() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
}

void CSCOMMDlg::OnButtonClearrecasenda() 
{
	// TODO: Add your control notification handler code here
	m_strSendData.Empty();
	UpdateData(FALSE);
}

void CSCOMMDlg::OnSelendokComboComselect() 
{
	// TODO: Add your control notification handler code here
	CString str;
	if(m_Port.m_hComm!=NULL)
	{
		m_Port.ClosePort();
	}
	//获取索引对应的参数值;	
	m_Com.GetLBText(m_Com.GetCurSel(),str);
	str.Remove('C');
	str.Remove('O');
	str.Remove('M');
	m_nCom = atoi(str); 
	//m_nCom=m_Com;
	CString strStatus;
	if (m_Port.InitPort(this, m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits,m_dwCommEvents,512))
	{
		if(!m_bOpenPort)
		{
			m_Port.StartMonitoring();
			m_ctrlIconOpenoff.SetIcon(m_hIconRed);
			strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		else
		{
			m_ctrlIconOpenoff.SetIcon(m_hIconOff);
			strStatus.Format("STATUS：COM%d CLOSED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		m_ctrlPortStatus.SetWindowText(strStatus);

	}
	else
	{
		m_ctrlIconOpenoff.SetIcon(m_hIconOff);
		AfxMessageBox("没有发现此串口或被占用");
	}


	
}

void CSCOMMDlg::OnSelendokComboSpeed() 
{
	// TODO: Add your control notification handler code here
	CString temp;
	int i=m_Speed.GetCurSel();
	switch(i)
	{
	case 0:
		i=300;
		break;
	case 1:
		i=600;
		break;
	case 2:
		i=1200;
		break;
	case 3:
		i=2400;
		break;
	case 4:
		i=4800;
		break;
	case 5:
		i=9600;
		break;
	case 6:
		i=19200;
		break;
	case 7:
		i=38400;
		break;
	case 8:
		i=43000;
		break;
	case 9:
		i=56000;
		break;
	case 10:
		i=57600;
		break;
	case 11:
		i=115200;
		break;
	default:
		break;

	}
	m_nBaud=i;
	CString strStatus;
	if (m_Port.InitPort(this, m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits,m_dwCommEvents,512))
	{
		if(!m_bOpenPort)
		{
			m_Port.StartMonitoring();
			m_ctrlIconOpenoff.SetIcon(m_hIconRed);
			

			strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		else
		{
			m_ctrlIconOpenoff.SetIcon(m_hIconOff);
			strStatus.Format("STATUS：COM%d CLOSED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		m_ctrlPortStatus.SetWindowText(strStatus);

	}
	else
	{
		AfxMessageBox("没有成功，请重试");
		m_ctrlIconOpenoff.SetIcon(m_hIconOff);

	}

	
}

void CSCOMMDlg::OnSelendokComboParity() 
{
	// TODO: Add your control notification handler code here
	char temp;
	int i=m_Parity.GetCurSel();
	switch(i)
	{
	case 0:
		temp='N';
		break;
	case 1:
		temp='O';
		break;
	case 2:
		temp='E';
		break;
	}
	m_cParity=temp;
	CString strStatus;
	if (m_Port.InitPort(this, m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits,m_dwCommEvents,512))
	{
		if(!m_bOpenPort)
		{
			m_Port.StartMonitoring();
			m_ctrlIconOpenoff.SetIcon(m_hIconRed);
			strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		else
		{
			m_ctrlIconOpenoff.SetIcon(m_hIconOff);
			strStatus.Format("STATUS：COM%d CLOSED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		m_ctrlPortStatus.SetWindowText(strStatus);

	}
	else
	{
		AfxMessageBox("没有成功，请重试");
		m_ctrlIconOpenoff.SetIcon(m_hIconOff);
	}

	
}

void CSCOMMDlg::OnSelendokComboDatabits() 
{
	// TODO: Add your control notification handler code here
	//char temp;
	int i=m_DataBits.GetCurSel();
	switch(i)
	{
	case 0:
		i=8;
		break;
	case 1:
		i=7;
		break;
	case 2:
		i=6;
		break;
	}
	m_nDatabits=i;
	CString strStatus;
	if (m_Port.InitPort(this, m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits,m_dwCommEvents,512))
	{
		if(!m_bOpenPort)
		{
			m_Port.StartMonitoring();
			m_ctrlIconOpenoff.SetIcon(m_hIconRed);
			strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		else
		{
			m_ctrlIconOpenoff.SetIcon(m_hIconOff);
			strStatus.Format("STATUS：COM%d CLOSED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		m_ctrlPortStatus.SetWindowText(strStatus);

	}
	else
	{
		AfxMessageBox("没有成功，请重试");
		m_ctrlIconOpenoff.SetIcon(m_hIconOff);
	}
	
	
}

void CSCOMMDlg::OnSelendokComboStopbits() 
{
	// TODO: Add your control notification handler code here
	int i=m_StopBits.GetCurSel();
	switch(i)
	{
	case 0:
		i=1;
		break;
	case 1:
		i=2;
		break;
	}
	m_nStopbits=i;
	CString strStatus;
	if (m_Port.InitPort(this, m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits,m_dwCommEvents,512))
	{
		if(!m_bOpenPort)
		{
			m_Port.StartMonitoring();
			m_ctrlIconOpenoff.SetIcon(m_hIconRed);
			strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		else
		{
			m_ctrlIconOpenoff.SetIcon(m_hIconOff);
			strStatus.Format("STATUS：COM%d CLOSED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		}
		m_ctrlPortStatus.SetWindowText(strStatus);

	}
	else
	{
		AfxMessageBox("没有成功，请重试");
		m_ctrlIconOpenoff.SetIcon(m_hIconOff);
	}
	
}

//保存显示数据
void CSCOMMDlg::OnButtonSavedata() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);

	int		nLength;
	nLength = m_strCurPath.GetLength();

	for( int nCount = 0; nCount < nLength; nCount++ )
	{
		if( m_strCurPath.GetAt( nCount ) == '\\' )
			CreateDirectory( m_strCurPath.Left( nCount + 1 ), NULL );
	}
	CreateDirectory( m_strCurPath, NULL );

	CFile m_rFile;
	LPCSTR	lpszPath =m_strCurPath;// "c:\\comdata";
	SetCurrentDirectory( lpszPath );
    
	//文件名为Rec**.txt,以下代码自动检测文件名是否存在，若存在，则后面序号自动递增
	//如Rec00.txt Rec01.txt,程序自动为正要保存的文件命名为Rec02.txt.
	char buf[20];   
	for(int j=0;j<100;j++)
	{
		sprintf_s(buf,"Rec%02d.txt",j);
		if( (_access( buf, 0 )) == -1 )//检查文件是否存在 存在返回0 否则返回-1
			break;
	}
    
	if(!m_rFile.Open(buf,CFile::modeCreate | CFile::modeWrite )) 
	{
		AfxMessageBox( "创建记录文件失败！");
		return;
	}
	if((_access(buf,0))==-1)
	{
		AfxMessageBox("failed");
		return;
	}
	CTime t = CTime::GetCurrentTime();
	CString str=t.Format("%Y年%m月%d日%H时%M分%S秒\r\n");
	m_rFile.Write((LPCTSTR)str,str.GetLength());
	m_rFile.Write((LPCTSTR)m_ReceiveData,m_ReceiveData.GetLength());
	m_rFile.Flush();
	m_rFile.Close();

    str="OK,";
	for(int i=0;i<5;i++)
	    str+=buf[i];
	str+=".txt saved";
	m_ctrlSavePath.SetWindowText(str);
	SetTimer(2,5000,NULL);   //在定时器中显示保存文件状态
}


//改变文件保存路径
void CSCOMMDlg::OnButtonDirbrowser() 
{
	// TODO: Add your control notification handler code here
	static char displayname[MAX_PATH];
	static char path[MAX_PATH];
    LPITEMIDLIST pidlBrowse;    // PIDL selected by user 
	BROWSEINFO bi;
	bi.hwndOwner = this->m_hWnd;
	bi.pidlRoot = NULL;
	bi.pszDisplayName = displayname;
	bi.lpszTitle = "请选择要保存接收数据的文件夹";
	bi.ulFlags = BIF_EDITBOX ;
	bi.lpfn = NULL;
	pidlBrowse=SHBrowseForFolder( &bi);
	if(pidlBrowse!=NULL)
	{
		SHGetPathFromIDList(pidlBrowse,path);
	}
	CString str=path;  //得到路径
	if(str.IsEmpty()) return;  //如果没有选择，就返回
	m_strCurPath=str;	//接收路径编辑框对应变量
	UpdateData(FALSE);	
}



void CSCOMMDlg::OnButtonCountreset() 
{
	// TODO: Add your control notification handler code here
	rxdatacount=0;
	CString strTemp;
	strTemp.Format("%ld",rxdatacount);
	strTemp="RX:"+strTemp;
	m_ctrlRXCOUNT.SetWindowText(strTemp);
	TX_count=0;
	strTemp.Format("%ld",TX_count);
	strTemp="TX:"+strTemp;
	m_ctrlTXCount.SetWindowText(strTemp);
	
}


void CSCOMMDlg::OnButtonClose() 
{
	// TODO: Add your control notification handler code here

	//CString str;
	//str.Format("RoaringWindSoft You can use all the functions of the SComAssistant,But if you registered:\r\nNo popup Message and No marks of RoaringWindStudio\r\nFree Updates(Send to you Automaticly by Email)\r\n Thank You");
	//AfxMessageBox(str);

	CSCOMMDlg::OnOK();
}


//选择要发送的文件
void CSCOMMDlg::OnButtonFilebrowser() 
{
	// TODO: Add your control notification handler code here
	LPCSTR	lpszPath = "c:\\comdata";
	SetCurrentDirectory( lpszPath );
	static char BASED_CODE szFilter[] = "文本文件(*.txt)|*.txt|所有文件(*.*)|*.*||";

	CFileDialog FileDlg( TRUE,  NULL,  NULL,OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
		 szFilter );
	FileDlg.m_ofn.lpstrInitialDir = lpszPath ;

	if( FileDlg.DoModal() ==IDOK )
	{

		CString strFileName = FileDlg.GetFileName( );
		CString strFileExt = FileDlg.GetFileExt( );
		CString lpstrName =  FileDlg.GetPathName( );
		m_strSendFilePathName=lpstrName;
		UpdateData(FALSE);
	}

}

//发送文件
void CSCOMMDlg::OnButtonSendfile() 
{
	// TODO: Add your control notification handler code here
	CFile fp;
	if(!(fp.Open((LPCTSTR)m_strSendFilePathName,CFile::modeRead))) 
	{
		AfxMessageBox("Open file failed!");
		return;
	}
	fp.SeekToEnd();
	unsigned long fplength = (unsigned long)fp.GetLength();
	m_nFileLength=fplength;
	char* fpBuff;
	fpBuff=new char[fplength];
	fp.SeekToBegin();
	if(fp.Read(fpBuff,fplength)<1)
	{
		fp.Close();
		return;
	}
	fp.Close();

	CString strStatus;
	if (m_Port.InitPort(this, m_nCom, m_nBaud, m_cParity, m_nDatabits, m_nStopbits, m_dwCommEvents, fplength))
	{
		m_Port.StartMonitoring();
		strStatus.Format("STATUS：COM%d OPENED，%d,%c,%d,%d",m_nCom, m_nBaud,m_cParity,m_nDatabits,m_nStopbits);
		m_ctrlIconOpenoff.SetIcon(m_hIconRed);
		m_bSendFile=TRUE;
		m_strTempSendFilePathName=m_strSendFilePathName;
		m_ctrlEditSendFile.SetWindowText("正在发送......");
		//发送文件时，以下功能不能使用
		m_ctrlManualSend.EnableWindow(FALSE); 
		m_ctrlAutoSend.EnableWindow(FALSE);
		m_ctrlSendFile.EnableWindow(FALSE);
		m_Port.WriteToPort((LPCTSTR)fpBuff,fplength);
	}
	else
	{
		AfxMessageBox("Failed to send file!");
		m_ctrlIconOpenoff.SetIcon(m_hIconOff);
	}
	delete fpBuff;
}


//检测文件是否发送完毕
LONG CSCOMMDlg::OnFileSendingEnded(WPARAM wParam,LPARAM port)
{
	if(m_bSendFile)
	{
		m_ctrlEditSendFile.SetWindowText("发送完毕!");//m_strSendFilePathName
		TX_count+=m_nFileLength;
		SetTimer(3,3000,NULL);
		CString strTemp;
		strTemp.Format("TX:%d",TX_count);
		m_ctrlTXCount.SetWindowText(strTemp);
		m_bSendFile=FALSE;
	}
	return 0;
}


void CSCOMMDlg::OnButtonPushpin() 
{
	// TODO: Add your control notification handler code here
	m_ctrlPushPin.ProcessClick();
	m_bVisible=!m_bVisible;
	if(m_bVisible)
	{
		SetWindowPos(&wndTopMost, 0, 0, 0, 0, SWP_NOMOVE|SWP_NOSIZE);
	}
	else
	{
		SetWindowPos(&wndBottom, 0, 0, 0, 0, SWP_NOMOVE|SWP_NOSIZE|SWP_NOREDRAW);
		BringWindowToTop();
	}
}

void CSCOMMDlg::OnDestroy() 
{
	CDialog::OnDestroy();
	m_ctrlAutoSend.SetCheck(0);  //强行关闭自动发送
	KillTimer(1);   //关闭定时器
	KillTimer(4); //?????????????????????????????????????????????????????????????????????
	m_Port.ClosePort();  //关闭串口
	m_ReceiveData.Empty();  //清空接收数据字符串
}

void CSCOMMDlg::OnButtonHelp() 
{
	// TODO: Add your control notification handler code here
	TCHAR exeFullPath[MAX_PATH]; 
	GetModuleFileName(NULL,exeFullPath,MAX_PATH);
	CString strlpPath;
	strlpPath.Format("%s",exeFullPath);
	strlpPath.MakeUpper();
	strlpPath.Replace("串口调试助手V2.2.EXE","");
	ShellExecute(NULL,NULL,_T("help.htm"),NULL,strlpPath,SW_SHOW);
}

// 获得电脑串口
void CSCOMMDlg::OnGetPort(CComboBox *ComNum)
{
	HKEY hKey;
	if (::RegOpenKeyEx(HKEY_LOCAL_MACHINE,_T("HARDWARE\\DEVICEMAP\\SERIALCOMM"),NULL,KEY_READ,&hKey) == ERROR_SUCCESS)
	{
		int i= 0;
		char portName[256],commName[256];
		DWORD dwLong,dwSize;
		while(1)
		{
			dwLong = dwSize = sizeof(portName);
			if (::RegEnumValue(hKey,i,(LPSTR)portName,&dwLong,NULL,NULL,(PUCHAR)commName,&dwSize) == ERROR_NO_MORE_ITEMS)
				break;

			ComNum->AddString((LPSTR)commName);
			i++;
		}
		if (ComNum->GetCount() == 0 )
		{
			::AfxMessageBox(_T("在HKEY_LOCAL_MACHINE:Hardware\\DrviceMap\\SerialComm里找不到串口！！"));
		}

		RegCloseKey(hKey);
	}
}