object ResolverForm: TResolverForm
  Left = 0
  Top = 0
  Caption = 'ResolverForm'
  ClientHeight = 503
  ClientWidth = 907
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
    907
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
  object Button1: TButton
    Left = 811
    Top = 30
    Width = 88
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Create Problem'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = 805
  end
  object Button2: TButton
    Left = 811
    Top = 443
    Width = 88
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Send'
    TabOrder = 2
    ExplicitLeft = 805
  end
  object Edit1: TEdit
    Left = 120
    Top = 445
    Width = 679
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
  end
  object WebBrowser1: TWebBrowser
    Left = 120
    Top = 32
    Width = 685
    Height = 401
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    ControlData = {
      4C000000CC460000722900000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
