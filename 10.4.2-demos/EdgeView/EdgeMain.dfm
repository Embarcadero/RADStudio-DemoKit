object EdgeViewForm: TEdgeViewForm
  Left = 0
  Top = 0
  Caption = 'EdgeView Demo'
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
    Height = 319
    Align = alClient
    TabOrder = 0
    OnExecuteScript = EdgeBrowser1ExecuteScript
    ExplicitTop = 89
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
    object btnGo: TButton
      Left = 8
      Top = 8
      Width = 41
      Height = 25
      Caption = 'Go'
      TabOrder = 0
      OnClick = btnGoClick
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
  object PageControl1: TPageControl
    Left = 0
    Top = 376
    Width = 635
    Height = 149
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'JavaScript'
      object memoJavaScript: TMemo
        Left = 88
        Top = 0
        Width = 539
        Height = 121
        Align = alClient
        Lines.Strings = (
          'alert("hello Delphi!");')
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 88
        Height = 121
        Align = alLeft
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object btnExecuteScript: TButton
          Left = 7
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Exec Script'
          TabOrder = 0
          OnClick = btnExecuteScriptClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Source'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 88
        Height = 121
        Align = alLeft
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        object btnViewSource: TButton
          Left = 4
          Top = 4
          Width = 78
          Height = 25
          Caption = 'View Source'
          TabOrder = 0
          OnClick = btnViewSourceClick
        end
        object btnSetSource: TButton
          Left = 4
          Top = 35
          Width = 78
          Height = 25
          Caption = 'Set Source'
          TabOrder = 1
          OnClick = btnSetSourceClick
        end
      end
      object memoHTML: TMemo
        Left = 88
        Top = 0
        Width = 539
        Height = 121
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
    end
  end
end
