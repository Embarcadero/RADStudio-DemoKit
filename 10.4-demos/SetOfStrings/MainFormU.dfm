object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'SetOfStr  DEMO - Daniele Teti'
  ClientHeight = 382
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    684
    382)
  PixelsPerInch = 96
  TextHeight = 19
  object btnSimple: TButton
    Left = 8
    Top = 8
    Width = 120
    Height = 57
    Caption = '1. Initialize'
    TabOrder = 0
    OnClick = btnSimpleClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 71
    Width = 668
    Height = 303
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object btnAddSets: TButton
    Left = 134
    Top = 8
    Width = 120
    Height = 57
    Caption = '2. Add Sets'
    TabOrder = 2
    OnClick = btnAddSetsClick
  end
  object btnIn: TButton
    Left = 260
    Top = 8
    Width = 120
    Height = 57
    Caption = '3. In Operator'
    TabOrder = 3
    OnClick = btnInClick
  end
  object btnIntersect: TButton
    Left = 386
    Top = 8
    Width = 120
    Height = 57
    Caption = '4. Intersection'
    TabOrder = 4
    OnClick = btnIntersectClick
  end
  object btnSubtract: TButton
    Left = 512
    Top = 8
    Width = 120
    Height = 57
    Caption = '5. Subtract'
    TabOrder = 5
    OnClick = btnSubtractClick
  end
end
