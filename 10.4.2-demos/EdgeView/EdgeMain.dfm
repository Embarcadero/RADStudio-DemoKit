object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 525
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EdgeBrowser1: TEdgeBrowser
    Left = 0
    Top = 57
    Width = 635
    Height = 390
    Align = alClient
    TabOrder = 0
    OnCreateWebViewCompleted = EdgeBrowser1CreateWebViewCompleted
    OnExecuteScript = EdgeBrowser1ExecuteScript
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    DesignSize = (
      635
      57)
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 41
      Height = 25
      Caption = 'Go'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 55
      Top = 10
      Width = 570
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'https://embarcadero.com'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 447
    Width = 635
    Height = 78
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 2
    object Memo1: TMemo
      Left = 88
      Top = 0
      Width = 547
      Height = 78
      Align = alClient
      Lines.Strings = (
        'alert("hello Delphi!");')
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 88
      Height = 78
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 1
      object Button2: TButton
        Left = 8
        Top = 11
        Width = 75
        Height = 25
        Caption = 'Exec Script'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 46
        Width = 75
        Height = 25
        Caption = 'View Source'
        TabOrder = 1
        OnClick = Button3Click
      end
    end
  end
end
