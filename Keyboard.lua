Keyboard = class()

function Keyboard:init()
   self.keyinfo = { 
    one = { chr="1", glyph="1", schr="!", sglyph="!", row=4, col=2 },
    two = { chr="2", glyph="2", schr="@", sglyph="@", row=4, col=3 },
    three = { chr="3", glyph="3", schr="#", sglyph="#", row=4, col=4 },
    four = { chr="4", glyph="4", schr="$", sglyph="$", row=4, col=5 },
    five = { chr="5", glyph="5", schr="%", sglyph="%", row=4, col=6 },
    six= { chr="6", glyph="6", schr="^", sglyph="^", row=4, col=7 },
    seven = { chr="7", glyph="7", schr="&", sglyph="&", row=4, col=8 },
    eight = { chr="8", glyph="8", schr="*", sglyph="*", row=4, col=9 },
    nine = { chr="9", glyph="9", schr="(", sglyph="(", row=4, col=10 },
    zero = { chr="0", glyph="0", schr=")", sglyph=")", row=4, col=11 },
    hyphen = { chr="-", glyph="-", schr="_",
        sglyph="_", row=4, col=12 },
    equal = { chr="=", glyph="=", schr="+", sglyph="+", row=4, col=13 },
    backspace = { chr="", glyph="bksp", schr="",
        sglyph="bksp", row=4, col=14 },
    q = { chr="q", glyph="q", schr="Q", sglyph="Q", row=3, col=3 },
    w = { chr="w", glyph="w", schr="W", sglyph="W", row=3, col=4 },
    e = { chr="e", glyph="e", schr="E", sglyph="E", row=3, col=5 },
    r = { chr="r", glyph="r", schr="R", sglyph="R", row=3, col=6 },
    t = { chr="t", glyph="t", schr="T", sglyph="T", row=3, col=7 },
    y = { chr="y", glyph="y", schr="Y", sglyph="Y", row=3, col=8 },
    u = { chr="u", glyph="u", schr="U", sglyph="U", row=3, col=9 },
    i = { chr="i", glyph="i", schr="I", sglyph="I", row=3, col=10 },
    o = { chr="o", glyph="o", schr="O", sglyph="O", row=3, col=11 },
    p = { chr="p", glyph="p", schr="P", sglyph="P", row=3, col=12 },
    left = { chr="[", glyph="[", schr="{", sglyph="{", row=3, col=13 },
    right = { chr="]", glyph="]", schr="{", sglyph="}", row=3, col=14 },
    backslash = { chr='\\', glyph='\\', schr="|",
        sglyph="|", row=3, col=15 },
    a = { chr="a", glyph="a", schr="A", sglyph="A", row=2, col=3 },
    s = { chr="s", glyph="s", schr="S", sglyph="S", row=2, col=4 },
    d = { chr="d", glyph="d", schr="D", sglyph="D", row=2, col=5 },
    f = { chr="f", glyph="f", schr="F", sglyph="F", row=2, col=6 },
    g = { chr="g", glyph="g", schr="G", sglyph="G", row=2, col=7 },
    h = { chr="h", glyph="h", schr="H", sglyph="H", row=2, col=8 },
    j = { chr="j", glyph="j", schr="J", sglyph="J", row=2, col=9 },
    k = { chr="k", glyph="k", schr="K", sglyph="K", row=2, col=10 },
    l = { chr="l", glyph="l", schr="L", sglyph="L", row=2, col=11 },
    semi = { chr=";", glyph=";", schr=":", sglyph=":", row=2, col=12 },
    quote = { chr="'", glyph="'", schr='"', sglyph='"', row=2, col=13 },
    enter = { chr="", glyph="enter", schr="",
        sglyph="enter", row=2, col=14 },
    lshift = { chr="", glyph="Shift", schr="",
        sglyph="Shift", row=1, col=2 },
    z = { chr="z", glyph="z", schr="Z", sglyph="Z", row=1, col=4 },
    x = { chr="x", glyph="x", schr="X", sglyph="X", row=1, col=5 },
    c = { chr="c", glyph="c", schr="C", sglyph="C", row=1, col=6 },
    v = { chr="v", glyph="v", schr="V", sglyph="V", row=1, col=7 },
    b = { chr="b", glyph="b", schr="B", sglyph="B", row=1, col=8 },
    n = { chr="n", glyph="n", schr="N", sglyph="N", row=1, col=9 },
    m = { chr="m", glyph="m", schr="M", sglyph="M", row=1, col=10 },
    comma = { chr=",", glyph=",", schr="<", sglyph="<", row=1, col=11 },
    dot = { chr=".", glyph=".", schr=">", sglyph=">", row=1, col=12 },
    slash = { chr="/", glyph="/", schr="?", sglyph="?", row=1, col=13 },
    rshift = { chr="", glyph="Shift", schr="",
        sglyph="Shift", row=1, col=14 },
    space = { chr=" ", glyph="space", schr="",
        sglyph="space", row=0x0, col=0x7 }

    }
    self.radius = 25 
    self.keyfont = HersheyRomanSimplex()
    self.shiftkeyfont = HersheyRomanSimplex()
    self.display = HersheyRomanSimplex()
    self.text = self.display:addlabel{txt="You typed: ", x=300, y=500}
    self.shifted = false
    self.drawpads = true
    self.keypressed = false
    local k,v, x, y
    for k,v in pairs(self.keyinfo) do
        x = v.col*(self.radius)*2 - self.radius*2
        if ((v.row == 3) or (v.row == 1)) then x=x-self.radius end
        y = self.radius + v.row*(self.radius)*2 + self.radius
        v.x=x
        v.y=y
        local w
        w = (self.radius - self.keyfont:stringwidth(v.glyph))/2
        self.keyfont:addlabel{ txt=v.glyph, x=x+w, y=y+4 }
        w = (self.radius - self.shiftkeyfont:stringwidth(v.sglyph))/2
        self.shiftkeyfont:addlabel{ txt=v.sglyph, x=x+w, y=y }
    end
end

function Keyboard:d2(a, b) -- dist^2 between 2 points
    return (a[1]-b[1])^2 + (a[2]-b[2])^2
end

function Keyboard:draw()
    if self.drawpads then
        pushStyle()
        noStroke()
        local k,v,r,r2
        r = self.radius*2
        r2 = self.radius/2
        for k,v in pairs(self.keyinfo) do
            if v.drawpad then
                v.drawpad()
            else
                ellipse(v.x+r2, v.y+r2, r, r)
            end
            --rect(v.x, v.y, r * string.len(v.glyph) -5, r -5)
        end
        popStyle()
    end
    if self.shifted then
        self.shiftkeyfont:draw()
    else
        self.keyfont:draw()
    end
    self.display:draw()
    local t = CurrentTouch
    if (t.state == BEGAN) then
        self.keypressed = true
        sound("hit", 314)
    end
    if ((t.state == ENDED) and self.keypressed) then
        self.keypressed = false
        local r2,k,v = self.radius^2
        for k,v in pairs(self.keyinfo) do
            if (self:d2({v.x, v.y}, {t.x, t.y}) < r2) then
                if (v.glyph == "Shift") then
                    self.shifted = not self.shifted
                else 
                    if (self.shifted) then
                        self.text.txt = self.text.txt .. v.schr
                    else
                        self.text.txt = self.text.txt .. v.chr
                    end
                end
            end
        end
    end
end
