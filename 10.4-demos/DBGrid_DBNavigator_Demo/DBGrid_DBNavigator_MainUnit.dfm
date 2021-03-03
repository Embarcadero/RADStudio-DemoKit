object DBGrid_DBNavigator_Form1: TDBGrid_DBNavigator_Form1
  Left = 0
  Top = 0
  Caption = 'VCL DBGrid && DBNavigator High-DPI Support'
  ClientHeight = 239
  ClientWidth = 467
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
    Left = 0
    Top = 13
    Width = 467
    Height = 13
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Alignment = taCenter
    Caption = 'VCL DBGrid && DBNavigator High-DPI Support'
    ExplicitLeft = 21
    ExplicitTop = 8
    ExplicitWidth = 212
  end
  object Label2: TLabel
    Left = 0
    Top = 26
    Width = 467
    Height = 13
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Caption = ' '
    ExplicitTop = 13
    ExplicitWidth = 3
  end
  object Label3: TLabel
    Left = 0
    Top = 0
    Width = 467
    Height = 13
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Caption = ' '
    ExplicitLeft = 15
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 39
    Width = 467
    Height = 33
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 21
    ExplicitTop = 29
    ExplicitWidth = 396
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 72
    Width = 467
    Height = 167
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Field1'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Field2'
        Width = 200
        Visible = True
      end>
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      500000009619E0BD010000001800000002000000000003000000500006466965
      6C64310100490000000100055749445448020002001400064669656C64320100
      4900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Field1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Field2'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 130
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 156
    Top = 130
  end
end
