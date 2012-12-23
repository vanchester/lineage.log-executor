object Form1: TForm1
  Left = 260
  Top = 149
  Width = 730
  Height = 536
  Caption = 'L2 LogExecutor by vanchester v0.1.5b'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    722
    490)
  PixelsPerInch = 96
  TextHeight = 13
  object lblProcess: TLabel
    Left = 0
    Top = 476
    Width = 721
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RichEdit1: TRichEdit
    Left = 2
    Top = 0
    Width = 717
    Height = 487
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object tmrRead: TTimer
    OnTimer = tmrReadTimer
    Left = 632
    Top = 10
  end
  object tmrCheckSettings: TTimer
    Enabled = False
    Interval = 60002
    OnTimer = tmrCheckSettingsTimer
    Left = 664
    Top = 10
  end
  object MainMenu1: TMainMenu
    Left = 664
    Top = 40
    object File1: TMenuItem
      Caption = '&File'
      object Openlogs1: TMenuItem
        Caption = '&Open LEx-logs'
        OnClick = Openlogs1Click
      end
      object OpenL2log1: TMenuItem
        Caption = 'O&pen L2-log'
        Enabled = False
        OnClick = OpenL2log1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        ShortCut = 16499
        OnClick = Exit1Click
      end
    end
    object Settings1: TMenuItem
      Caption = '&Settings'
      object Edit1: TMenuItem
        Caption = '&Edit'
        ShortCut = 16453
        OnClick = Edit1Click
      end
      object Reload1: TMenuItem
        Caption = '&Reload'
        ShortCut = 16466
        OnClick = Reload1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Scroll1: TMenuItem
        Caption = 'Scro&ll'
        OnClick = Scroll1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = 'A&bout'
        OnClick = About1Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 664
    Top = 70
    object Selectall1: TMenuItem
      Caption = 'Select &all'
      OnClick = Selectall1Click
    end
    object Copyselected1: TMenuItem
      Caption = '&Copy selected'
      OnClick = Copyselected1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Clear1: TMenuItem
      Caption = 'Clear all'
      OnClick = Clear1Click
    end
  end
end
