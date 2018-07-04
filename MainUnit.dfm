object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1048#1075#1088#1072' "'#1055#1103#1090#1085#1072#1096#1082#1080'"'
  ClientHeight = 384
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainGrid: TGridPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 384
    Align = alClient
    Caption = 'MainGrid'
    ColumnCollection = <
      item
        Value = 33.333333333333330000
      end
      item
        Value = 33.333333333333330000
      end
      item
        Value = 33.333333333333330000
      end>
    ControlCollection = <>
    ExpandStyle = emFixedSize
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 688
    Top = 88
    object Update: TMenuItem
      Caption = #1053#1072#1095#1072#1090#1100' '#1079#1072#1085#1086#1074#1086
      OnClick = UpdateClick
    end
    object SetSize: TMenuItem
      Caption = #1047#1072#1076#1072#1090#1100' '#1088#1072#1079#1084#1077#1088' '#1087#1086#1083#1103
      OnClick = SetSizeClick
    end
  end
end
