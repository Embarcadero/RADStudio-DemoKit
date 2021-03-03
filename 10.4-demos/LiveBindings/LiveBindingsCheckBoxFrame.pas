unit LiveBindingsCheckBoxFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.StdCtrls;

type
  TFrame2 = class(TFrame)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses LiveBindingsDataModule;

end.
