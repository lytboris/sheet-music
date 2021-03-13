\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

\header{
  title = "Долгая счастливая жизнь (ГрОб)"
}

global = {
  \key c \major
  \time 4/4
}

sopMusicChorus = \relative {
  g'8 g g g fis fis fis g~ | g2~ g8 c c c | b b b b a a a g~ |
  g4 r r8 c c c | d b b b a a a b~ | b2 a8 a a a | g2 fis8 g a fis |
  g8. a16 b4 a8 a a a | g2 b8 b b b | \partial 2. b2. \bar ""
}

sopMusic = \relative {
  \partial 4 d'8 e | f f f f e e e e~ | e r8 r2 d8 e | f4 f8 f e e e e~ | e r8 r4 r4 d8 e |
  f f f f e e e e~ | e1 | a2~\( a | g~ g\) | a~\( a | g~ g\) |
  a~\( a | g( fis)\) | 
  \repeat volta 2 { \sopMusicChorus }
  \alternative { {
  \partial 4 r4 | a2~\( a | gis1\) | a2~\( a |
  gis1\) | a2~ a | gis2. e8 d16 c~ | c4  a8. a16 a'8 g f g~ | g2 r4 b,8 b16 c~ |
  c4 a8 a c' b a g~ | g2 r4 e8 d | e e e e e' d c g~ | g2( a) |
  }
  {
  \partial 4 r4
  }
  }
}

altoMusicChorus = \relative {
  d'8 d d d dis dis dis e~ | e2~ e8 g g g | g d d d dis dis dis e~ |
  e4 r r8 g g g | b g g g fis fis fis g~ | g2 fis8 fis fis fis | e2 dis8 e fis dis |
  e8. fis16 g4 fis8 fis fis fis | e2 fis8 fis fis fis | g2.   
}

altoMusic = \relative {
  \partial 4 a8  b | c c c c c c c b~ | b r8 r2 a8 b | c4 c8 c c c c b~ | b r8 r4 r4 a8 b |
  c c c c c c c  b~ | b1 | e2~\( e | e( d)\) | e~\( f | d~ d\) |
  e\( f | e( fis)\) | 
  \repeat volta 2 {  \altoMusicChorus }
  \alternative { {                  
  r4 | f2\( e | e1\) | f2\( e |
  e1 | f2 e | e2. e8 d16 c~ | c4  a8. a16 f'8 e d e | e2 r4 b8 b16 c |
  a4 a8 a a' g f e~ | e2 r4  e8 d | e e e e <c' a> <b g> <a f> e~ | e2 fis |
  }                
  {
  r4
  }
  }
}

tenorMusicChorus = \relative {
  b8 b b b b b b b~ | b2~ b8 e e e | d b b b b b b b~ |
  b4 r r8 e e e | g d d d d d d e~ | e2 d8 d d d | c2 b8 b b b |
  << { \voiceOne s2 } \new Voice { \voiceTwo b2~ } >> \oneVoice d8 d d d | c2 dis8 dis dis dis | e2.  
}

tenorMusic = \relative {
  \partial 4 a8 b | a a a a a a a gis~ | gis r8 r2 a8 b | a4 a8 a a a a gis~ | gis r8 r4 r4 a8 b | 
  a a a a a a a gis~ | gis1 | c2~\( c | c~ b\) | c~\( c | c~ b\) |
  c~\( c | c( d)\) | 
  \repeat volta 2 { \tenorMusicChorus }
  \alternative { {
  r4 | c2\( c | b1\) | c2\( c |
  b1 | c2~ c | b2. c8 b16 a~ | a4 a8. a16 c8 c c c | c2 r4 g8 g16 a |
  c4 a8 a c c c c~ | c2 r4 b8 b | c c c c c c c c~ | c2( d) |
  }
  {
  r4
  }
  }
}

baseMusicChorus = \relative {
  g8 g g g b, b b e~ | e2~ e8 c c c | g' g g g b, b b e~ |
  e4 r r8 c c c| g' g g g b, b b e~ | e2 d8 d d d | c2 b8 b b b |
  e2 d8 d d d | c2 b8 b b b | e2. 
}

bassMusic = \relative {
  \partial 4 d4\rest | R1*4 |
  | R1 | r2 r4 r8 c8 | a a a a16 a'~ a8 g f e~ | e2. a,8 b | c4 a8 a16 a'~ a8 g f e~ | e2. a,8 b |
  c b c c a' g f g~ | g2( a) | 
  \repeat volta 2 {   \baseMusicChorus }
  \alternative { {
  d,8 e | f f f f e e e4 | e2. d8 e | f4 f8 f e e e e~ |
  e2. d8 e | f4 f8 f e e e e~ | e4 e e e8 d16 c~ | c4  a8. a16 a'8 g f g~( | g4. f8 e4) e8 e16 e |
  e4 e8 e f f f g~ | g2 r4 g8 g | a a a g f f f g~ | g2( d) |
  }
  {
  r4 
  }
  }
}


altoWords = \lyricmode {
  По тря се ни ям и пра здни кам -- нет! Го ри зон там и праз дни кам -- нет! Вдох но
  ве ни ям и праз дни кам нет!
}

chorusWords = \lyricmode {
 { Дол гая я счаст ли ва я жизнь, __ та ка я дол га я счаст ли ва я жизнь,
 от ны не дол га я счаст ли ва я жизнь, каж до му из нас, каж до му из
 нас, каж до му из нас, каж до му из нас. }
}

bassFirstVerseWords =  \lyricmode {
 Без рыбь е в_зо ло той по лы нье, __ ве зде сущ ность мы ши ной во зни, __ злы е
 cу мер ки бес смерт но го дня __ 
}

bassWords =  \lyricmode {
 Без рыбь е в_зо ло той по лы нье, __ ве зде сущ ность мы ши ной во зни, __ злы е
 cу мер ки бес смерт но го дня __ 
 \repeat volta 2 { \chorusWords }
 \alternative { {
 Бес по щад ны е глу би ны мор щин.
 Мар си ан ски е впа ди ны глаз __
 Мар си ан ски е хро ни ки нас, нас, нас.
 Пос ре ди __ о ди на ко вых стен __
 В гро бо вых от да лён ных до мах __
 В_не про глаз ной ле дя ной ти ши не __
                }
                {
                }
 }
}

bassWordsThirdVerse = \lyricmode {
 Ис ку ше ни ям и пра здни кам -- нет
 Пре сту пле_ни ям и пра здни кам -- нет __ 
 Иск лю че_ни ям и пра здни кам -- нет, __ нет, нет.
 На се ми __ про ду вных скво зня ках __
 По бо ло там, по пу сты ням, сте пям __
 По су гро бам, по гря зи, по зе мле __
}

\score {
  \layout { }
  \midi {
    \tempo 4 = 98
  }
  \new ChoirStaff <<
    \new Staff = "women" \with {midiInstrument = #"clarinet"} <<
      \new Voice = "sopranos" {
      <<
        \global
        \sopMusic
        \altoMusic
        \tenorMusic
      >>
      }
    >>
    \new Lyrics = "altos" \with { alignAboveContext = "women" }
    \new Staff = "men" \with {midiInstrument = #"cello"}  <<
      \clef bass
      \new Voice = "basses" {
        <<
          \global \bassMusic
        >>
      }
    >>
    \context Lyrics = "" \lyricsto "sopranos" \altoWords
    \new Lyrics = "basses"
    \context Lyrics = "basses" \lyricsto "basses" \bassWords

  >>
}