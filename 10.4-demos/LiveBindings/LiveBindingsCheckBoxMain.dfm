object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'LiveBindings CheckBox Performance'
  ClientHeight = 757
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 1113
    Height = 23
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'This form contains 8 frames, each with 10 check boxes, all bound' +
      ' together. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    ExplicitWidth = 639
  end
  object Label2: TLabel
    Left = 0
    Top = 23
    Width = 1113
    Height = 33
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Changing one immediately chages the other 79 immediately.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    ExplicitTop = 8
  end
  inline Frame22: TFrame2
    Left = 312
    Top = 28
    Width = 227
    Height = 360
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    ExplicitLeft = 312
    ExplicitTop = 28
  end
  inline Frame23: TFrame2
    Left = 600
    Top = 28
    Width = 227
    Height = 360
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    ExplicitLeft = 600
    ExplicitTop = 28
  end
  inline Frame24: TFrame2
    Left = 24
    Top = 394
    Width = 227
    Height = 360
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    ExplicitLeft = 24
    ExplicitTop = 394
  end
  inline Frame25: TFrame2
    Left = 312
    Top = 394
    Width = 227
    Height = 360
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    ExplicitLeft = 312
    ExplicitTop = 394
  end
  inline Frame26: TFrame2
    Left = 592
    Top = 394
    Width = 227
    Height = 360
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    ExplicitLeft = 592
    ExplicitTop = 394
  end
  inline Frame27: TFrame2
    Left = 856
    Top = 28
    Width = 227
    Height = 360
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    ExplicitLeft = 856
    ExplicitTop = 28
  end
  inline Frame28: TFrame2
    Left = 856
    Top = 394
    Width = 227
    Height = 360
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 6
    ExplicitLeft = 856
    ExplicitTop = 394
  end
  object RelativePanel1: TRelativePanel
    Left = 0
    Top = 56
    Width = 1113
    Height = 701
    ControlCollection = <>
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 7
    ExplicitTop = 8
    ExplicitHeight = 744
  end
  inline Frame21: TFrame2
    Left = 24
    Top = 28
    Width = 227
    Height = 360
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 8
    ExplicitLeft = 24
    ExplicitTop = 28
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 552
    Top = 192
  end
end
