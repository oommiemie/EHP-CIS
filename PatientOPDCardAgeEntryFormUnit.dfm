object PatientOPDCardAgeEntryForm: TPatientOPDCardAgeEntryForm
  Left = 0
  Top = 0
  ClientHeight = 234
  ClientWidth = 505
  Caption = 'PatientOPDCardAgeEntryForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  FreeOnClose = False
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 45
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 18
      Top = 13
      Width = 83
      Height = 19
      Caption = #3585#3635#3627#3609#3604#3629#3634#3618#3640
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 1
      LayoutConfig.Cls = 'font-bms-text-shadow-0'
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 187
    Width = 505
    Height = 47
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    DesignSize = (
      505
      47)
    object UniButton1: TUniButton
      Left = 400
      Top = 9
      Width = 89
      Height = 27
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      ImageIndex = 3
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 302
      Top = 9
      Width = 89
      Height = 27
      Caption = #3605#3585#3621#3591
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      ImageIndex = 4
      OnClick = UniButton2Click
    end
  end
  object cxGroupBox1: TUniGroupBox
    Left = 0
    Top = 45
    Width = 505
    Height = 142
    Caption = #3585#3635#3627#3609#3604#3629#3634#3618#3640
    Align = alClient
    TabOrder = 2
    object Label1: TUniLabel
      Left = 142
      Top = 70
      Width = 10
      Height = 19
      Caption = #3611#3637
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 271
      Top = 70
      Width = 35
      Height = 19
      Caption = #3648#3604#3639#3629#3609
      TabOrder = 5
    end
    object Label3: TUniLabel
      Left = 440
      Top = 70
      Width = 18
      Height = 19
      Caption = #3623#3633#3609
      TabOrder = 6
    end
    object YearEdit: TUniSpinEdit
      Left = 52
      Top = 65
      Width = 84
      Height = 29
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts) {'#13#10'  var el = se' +
          'nder.inputEl;'#13#10#13#10'  el.on('#39'keydown'#39', function(e) {'#13#10'    var code ' +
          '= e.getKey ? e.getKey() : e.keyCode;'#13#10'    if (code === 189 || co' +
          'de === 109 || code === 173) { e.stopEvent(); return; } // '#39'-'#39#13#10' ' +
          '   if (code === 40) { e.stopEvent(); return; }'#13#10'  });'#13#10#13#10'  el.on' +
          '('#39'keypress'#39', function(e) {'#13#10'    var ch = String.fromCharCode(e.g' +
          'etCharCode ? e.getCharCode() : e.charCode);'#13#10'    if (ch === '#39'-'#39')' +
          ' { e.stopEvent(); }'#13#10'  });'#13#10#13#10'  el.on('#39'paste'#39', function(e) {'#13#10'  ' +
          '  var clip = (e.clipboardData || window.clipboardData);'#13#10'    if ' +
          '(!clip) return;'#13#10'    var text = clip.getData('#39'text'#39');'#13#10'    if (t' +
          'ext && text.indexOf('#39'-'#39') !== -1) {'#13#10'      e.stopEvent();'#13#10'      ' +
          'var cleaned = text.replace(/-/g, '#39#39');'#13#10'      setTimeout(function' +
          '() {'#13#10'        var cur = sender.getRawValue() || '#39#39';'#13#10'        sen' +
          'der.setRawValue(cur + cleaned);'#13#10'      }, 0);'#13#10'    }'#13#10'  });'#13#10#13#10' ' +
          ' var downBtn = sender.getEl().down('#39'.x-form-spinner-down'#39') || se' +
          'nder.getEl().down('#39'.x-form-trigger-spinner-down'#39');'#13#10'  if (downBt' +
          'n) {'#13#10'    var stopIfZeroOrLess = function(e){'#13#10'      var v = par' +
          'seInt(sender.getValue() || 0, 10);'#13#10'      if (isNaN(v)) v = 0;'#13#10 +
          '      if (v <= 0) {'#13#10'        e.stopEvent();'#13#10'        sender.setV' +
          'alue(0);'#13#10'      }'#13#10'    };'#13#10'    downBtn.on('#39'mousedown'#39', stopIfZer' +
          'oOrLess);'#13#10'    downBtn.on('#39'click'#39',     stopIfZeroOrLess);'#13#10'  }'#13#10 +
          #13#10'  sender.on('#39'change'#39', function(f, newV){'#13#10'    var v = parseInt' +
          '(newV || 0, 10);'#13#10'    if (isNaN(v) || v < 0) f.setValue(0);'#13#10'  }' +
          ');'#13#10#13#10'}'#13#10)
      TabOrder = 0
      Alignment = taCenter
      OnChange = YearEditChange
    end
    object MonthEdit: TUniSpinEdit
      Left = 181
      Top = 65
      Width = 84
      Height = 29
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts) {'#13#10'  var el = se' +
          'nder.inputEl;'#13#10#13#10'  el.on('#39'keydown'#39', function(e) {'#13#10'    var code ' +
          '= e.getKey ? e.getKey() : e.keyCode;'#13#10'    if (code === 189 || co' +
          'de === 109 || code === 173) { e.stopEvent(); return; } // '#39'-'#39#13#10' ' +
          '   if (code === 40) { e.stopEvent(); return; }'#13#10'  });'#13#10#13#10'  el.on' +
          '('#39'keypress'#39', function(e) {'#13#10'    var ch = String.fromCharCode(e.g' +
          'etCharCode ? e.getCharCode() : e.charCode);'#13#10'    if (ch === '#39'-'#39')' +
          ' { e.stopEvent(); }'#13#10'  });'#13#10#13#10'  el.on('#39'paste'#39', function(e) {'#13#10'  ' +
          '  var clip = (e.clipboardData || window.clipboardData);'#13#10'    if ' +
          '(!clip) return;'#13#10'    var text = clip.getData('#39'text'#39');'#13#10'    if (t' +
          'ext && text.indexOf('#39'-'#39') !== -1) {'#13#10'      e.stopEvent();'#13#10'      ' +
          'var cleaned = text.replace(/-/g, '#39#39');'#13#10'      setTimeout(function' +
          '() {'#13#10'        var cur = sender.getRawValue() || '#39#39';'#13#10'        sen' +
          'der.setRawValue(cur + cleaned);'#13#10'      }, 0);'#13#10'    }'#13#10'  });'#13#10#13#10' ' +
          ' var downBtn = sender.getEl().down('#39'.x-form-spinner-down'#39') || se' +
          'nder.getEl().down('#39'.x-form-trigger-spinner-down'#39');'#13#10'  if (downBt' +
          'n) {'#13#10'    var stopIfZeroOrLess = function(e){'#13#10'      var v = par' +
          'seInt(sender.getValue() || 0, 10);'#13#10'      if (isNaN(v)) v = 0;'#13#10 +
          '      if (v <= 0) {'#13#10'        e.stopEvent();'#13#10'        sender.setV' +
          'alue(0);'#13#10'      }'#13#10'    };'#13#10'    downBtn.on('#39'mousedown'#39', stopIfZer' +
          'oOrLess);'#13#10'    downBtn.on('#39'click'#39',     stopIfZeroOrLess);'#13#10'  }'#13#10 +
          #13#10'  sender.on('#39'change'#39', function(f, newV){'#13#10'    var v = parseInt' +
          '(newV || 0, 10);'#13#10'    if (isNaN(v) || v < 0) f.setValue(0);'#13#10'  }' +
          ');'#13#10'}'#13#10)
      TabOrder = 1
      Alignment = taCenter
      OnChange = YearEditChange
    end
    object DayEdit: TUniSpinEdit
      Left = 350
      Top = 65
      Width = 84
      Height = 29
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts) {'#13#10'  var el = se' +
          'nder.inputEl;'#13#10#13#10'  el.on('#39'keydown'#39', function(e) {'#13#10'    var code ' +
          '= e.getKey ? e.getKey() : e.keyCode;'#13#10'    if (code === 189 || co' +
          'de === 109 || code === 173) { e.stopEvent(); return; } // '#39'-'#39#13#10' ' +
          '   if (code === 40) { e.stopEvent(); return; }'#13#10'  });'#13#10#13#10'  el.on' +
          '('#39'keypress'#39', function(e) {'#13#10'    var ch = String.fromCharCode(e.g' +
          'etCharCode ? e.getCharCode() : e.charCode);'#13#10'    if (ch === '#39'-'#39')' +
          ' { e.stopEvent(); }'#13#10'  });'#13#10#13#10'  el.on('#39'paste'#39', function(e) {'#13#10'  ' +
          '  var clip = (e.clipboardData || window.clipboardData);'#13#10'    if ' +
          '(!clip) return;'#13#10'    var text = clip.getData('#39'text'#39');'#13#10'    if (t' +
          'ext && text.indexOf('#39'-'#39') !== -1) {'#13#10'      e.stopEvent();'#13#10'      ' +
          'var cleaned = text.replace(/-/g, '#39#39');'#13#10'      setTimeout(function' +
          '() {'#13#10'        var cur = sender.getRawValue() || '#39#39';'#13#10'        sen' +
          'der.setRawValue(cur + cleaned);'#13#10'      }, 0);'#13#10'    }'#13#10'  });'#13#10#13#10' ' +
          ' var downBtn = sender.getEl().down('#39'.x-form-spinner-down'#39') || se' +
          'nder.getEl().down('#39'.x-form-trigger-spinner-down'#39');'#13#10'  if (downBt' +
          'n) {'#13#10'    var stopIfZeroOrLess = function(e){'#13#10'      var v = par' +
          'seInt(sender.getValue() || 0, 10);'#13#10'      if (isNaN(v)) v = 0;'#13#10 +
          '      if (v <= 0) {'#13#10'        e.stopEvent();'#13#10'        sender.setV' +
          'alue(0);'#13#10'      }'#13#10'    };'#13#10'    downBtn.on('#39'mousedown'#39', stopIfZer' +
          'oOrLess);'#13#10'    downBtn.on('#39'click'#39',     stopIfZeroOrLess);'#13#10'  }'#13#10 +
          #13#10'  sender.on('#39'change'#39', function(f, newV){'#13#10'    var v = parseInt' +
          '(newV || 0, 10);'#13#10'    if (isNaN(v) || v < 0) f.setValue(0);'#13#10'  }' +
          ');'#13#10'}'#13#10)
      TabOrder = 2
      Alignment = taCenter
      OnChange = YearEditChange
    end
  end
end
