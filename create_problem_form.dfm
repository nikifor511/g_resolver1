object CreateProblemForm: TCreateProblemForm
  Left = 0
  Top = 0
  Caption = 'CreateProblemForm'
  ClientHeight = 172
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    482
    172)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 20
    Height = 13
    Caption = 'Title'
  end
  object Label2: TLabel
    Left = 16
    Top = 51
    Width = 41
    Height = 13
    Caption = 'Describe'
  end
  object Edit1: TEdit
    Left = 82
    Top = 8
    Width = 272
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 82
    Top = 48
    Width = 272
    Height = 105
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 140
    Width = 60
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Urgently'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 371
    Top = 8
    Width = 97
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Create problem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 371
    Top = 46
    Width = 97
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = Button2Click
  end
end
