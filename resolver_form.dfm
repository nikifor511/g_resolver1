object ResolverForm: TResolverForm
  Left = 0
  Top = 0
  Caption = 'ResolverForm'
  ClientHeight = 503
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    901
    503)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 482
    Width = 28
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '<...>'
  end
  object Label2: TLabel
    Left = 8
    Top = 13
    Width = 43
    Height = 13
    Caption = 'problems'
  end
  object Label3: TLabel
    Left = 120
    Top = 13
    Width = 21
    Height = 13
    Caption = 'chat'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 32
    Width = 97
    Height = 401
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = ListBox1DblClick
  end
  object JvRichEdit1: TJvRichEdit
    Left = 120
    Top = 32
    Width = 679
    Height = 401
    Alignment = taRightJustify
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    SelText = ''
    TabOrder = 1
  end
  object Button1: TButton
    Left = 805
    Top = 30
    Width = 88
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Create Problem'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 805
    Top = 443
    Width = 88
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Send'
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 120
    Top = 445
    Width = 679
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
end
