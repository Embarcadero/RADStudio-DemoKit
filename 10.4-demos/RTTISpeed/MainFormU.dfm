object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 330
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnSpeedTest: TButton
    Left = 8
    Top = 8
    Width = 169
    Height = 49
    Caption = 'Serialize 1 million of object to a JSON Array of JSON Object'
    TabOrder = 0
    WordWrap = True
    OnClick = btnSpeedTestClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 63
    Width = 472
    Height = 250
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
