object PreForm: TPreForm
  Left = 0
  Top = 0
  Caption = 'PreForm'
  ClientHeight = 281
  ClientWidth = 560
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
  object Button1: TButton
    Left = 24
    Top = 25
    Width = 75
    Height = 25
    Caption = 'LogIn'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RichEdit1: TRichEdit
    Left = 24
    Top = 56
    Width = 505
    Height = 209
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Zoom = 100
  end
  object Button2: TButton
    Left = 120
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Register'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 454
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button3Click
  end
end
