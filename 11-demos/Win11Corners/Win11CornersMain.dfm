object Win11CornersForm: TWin11CornersForm
  Left = 0
  Top = 0
  Caption = 'Windows 11 Rounding Demo'
  ClientHeight = 608
  ClientWidth = 695
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 31
  CustomTitleBar.SystemColors = False
  CustomTitleBar.SystemButtons = False
  CustomTitleBar.BackgroundColor = clSkyBlue
  CustomTitleBar.ForegroundColor = 65793
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = 65793
  CustomTitleBar.ButtonBackgroundColor = clSkyBlue
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = clTeal
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = clAqua
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 31
  StyleElements = [seFont, seClient]
  PixelsPerInch = 144
  DesignSize = (
    695
    608)
  TextHeight = 25
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    CustomButtons = <>
  end
  object Panel1: TPanel
    Left = 194
    Top = 141
    Width = 414
    Height = 420
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Anchors = [akBottom]
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object Button1: TButton
      Left = 18
      Top = 72
      Width = 194
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'No Rounding'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Tag = 1
      Left = 18
      Top = 120
      Width = 194
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Regular Round'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Tag = 2
      Left = 18
      Top = 168
      Width = 194
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Small Rounding'
      TabOrder = 2
      OnClick = Button1Click
    end
    object CheckBox1: TCheckBox
      Left = 36
      Top = 36
      Width = 170
      Height = 26
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Custom Title Bar'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
  end
end
