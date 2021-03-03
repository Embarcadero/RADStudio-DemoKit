object Messages_Demo_MainForm: TMessages_Demo_MainForm
  Left = 0
  Top = 0
  Caption = 'Messages - Demo'
  ClientHeight = 299
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnAfterMonitorDpiChanged = FormAfterMonitorDpiChanged
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 28
    Height = 13
    Caption = 'Style:'
  end
  object Button1: TButton
    Left = 24
    Top = 74
    Width = 305
    Height = 41
    Caption = 'Show message with custom caption for buttons'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 68
    Top = 21
    Width = 261
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object Button2: TButton
    Left = 192
    Top = 137
    Width = 137
    Height = 41
    Caption = 'Show Error Message'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 137
    Width = 146
    Height = 41
    Caption = 'Show Message'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 192
    Width = 146
    Height = 41
    Caption = 'Show Warning Message'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 192
    Top = 192
    Width = 137
    Height = 41
    Caption = 'Show Info Message'
    TabOrder = 5
    OnClick = Button2Click
  end
end
