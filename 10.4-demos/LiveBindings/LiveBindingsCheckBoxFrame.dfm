object Frame2: TFrame2
  Left = 0
  Top = 0
  Width = 227
  Height = 360
  DoubleBuffered = True
  ParentDoubleBuffered = False
  TabOrder = 0
  object CheckBox1: TCheckBox
    Left = 40
    Top = 32
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 0
  end
  object CheckBox2: TCheckBox
    Left = 40
    Top = 62
    Width = 97
    Height = 17
    Caption = 'CheckBox2'
    TabOrder = 1
  end
  object CheckBox3: TCheckBox
    Left = 40
    Top = 92
    Width = 97
    Height = 17
    Caption = 'CheckBox3'
    TabOrder = 2
  end
  object CheckBox4: TCheckBox
    Left = 40
    Top = 122
    Width = 97
    Height = 17
    Caption = 'CheckBox4'
    TabOrder = 3
  end
  object CheckBox5: TCheckBox
    Left = 40
    Top = 152
    Width = 97
    Height = 17
    Caption = 'CheckBox5'
    TabOrder = 4
  end
  object CheckBox6: TCheckBox
    Left = 40
    Top = 182
    Width = 97
    Height = 17
    Caption = 'CheckBox6'
    TabOrder = 5
  end
  object CheckBox7: TCheckBox
    Left = 40
    Top = 212
    Width = 97
    Height = 17
    Caption = 'CheckBox7'
    TabOrder = 6
  end
  object CheckBox8: TCheckBox
    Left = 40
    Top = 240
    Width = 97
    Height = 17
    Caption = 'CheckBox8'
    TabOrder = 7
  end
  object CheckBox9: TCheckBox
    Left = 40
    Top = 272
    Width = 97
    Height = 17
    Caption = 'CheckBox9'
    TabOrder = 8
  end
  object CheckBox10: TCheckBox
    Left = 40
    Top = 302
    Width = 97
    Height = 17
    Caption = 'CheckBox10'
    TabOrder = 9
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DataModule3.FDMemTable1
    ScopeMappings = <>
    Left = 168
    Top = 24
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 180
    Top = 85
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox1
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox10
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox4
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox7
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox5
      Track = True
    end
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox6
      Track = True
    end
    object LinkControlToField7: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox9
      Track = True
    end
    object LinkControlToField8: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox2
      Track = True
    end
    object LinkControlToField9: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox3
      Track = True
    end
    object LinkControlToField10: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Option'
      Control = CheckBox8
      Track = True
    end
  end
end
