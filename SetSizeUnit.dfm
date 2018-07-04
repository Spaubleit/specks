object SizeForm: TSizeForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1047#1072#1076#1072#1085#1080#1077' '#1088#1072#1079#1084#1077#1088#1072' '#1087#1086#1083#1103
  ClientHeight = 80
  ClientWidth = 208
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 13
    Caption = #1064#1080#1088#1080#1085#1072
  end
  object Label2: TLabel
    Left = 112
    Top = 8
    Width = 37
    Height = 13
    Caption = #1042#1099#1089#1086#1090#1072
  end
  object WidthUpDown: TUpDown
    Left = 83
    Top = 21
    Width = 16
    Height = 21
    Associate = WidthTextBox
    Min = 2
    Position = 2
    TabOrder = 0
    OnClick = WidthUpDownClick
  end
  object WidthTextBox: TEdit
    Left = 8
    Top = 21
    Width = 75
    Height = 21
    TabOrder = 1
    Text = '2'
  end
  object HeightTextBox: TEdit
    Left = 112
    Top = 21
    Width = 73
    Height = 21
    TabOrder = 2
    Text = '2'
  end
  object HeightUpDown: TUpDown
    Left = 185
    Top = 21
    Width = 16
    Height = 21
    Associate = HeightTextBox
    Min = 2
    Position = 2
    TabOrder = 3
    OnClick = HeightUpDownClick
  end
  object SaveButton: TButton
    Left = 8
    Top = 48
    Width = 90
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ModalResult = 6
    TabOrder = 4
  end
  object CancelButton: TButton
    Left = 112
    Top = 48
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 7
    TabOrder = 5
  end
end
