\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

\header{
  title = "Долгая счастливая жизнь (ГрОб)"
}

global = {
  \key c \major
  \time 4/4
}

sopMusic = \relative {
  \partial 4 d'8 e | f f f f e e e e~ | e r8 r2 d8 e | f4 f8 f e e e e~ | e r8 r4 r4 d8 e |
  f f f f e e e e~ | e1 | a2~\( a | g~ g\) | a~\( a | g~ g\) |
  a~\( a | g( fis)\) |
}

altoMusic = \relative {
  \partial 4 a8  b | c c c c c c c b~ | b r8 r2 a8 b | c4 c8 c c c c b~ | b r8 r4 r4 a8 b |
  c c c c c c c  b~ | b1 | e2~\( e | e( d)\) | e~\( f | d~ d\) |
  e\( f | e( fis)\) |
}

tenorMusic = \relative {
  \partial 4 a8 b | a a a a a a a gis~ | gis r8 r2 a8 b | a4 a8 a a a a gis~ | gis r8 r4 r4 a8 b | 
  a a a a a a a gis~ | gis1 | c2~\( c | c~ b\) | c~\( c | c~ b\) |
  c~\( c | c( d)\) |
}

bassMusic = \relative {
  \partial 4 d4\rest | R1*4 |
  | R1 | r2 r4 r8 c8 | a a a a16 a'~ a8 g f e~ | e2. a,8 b | c4 a8 a16 a'~ a8 g f e~ | e2. a,8 b |
  c b c c a' g f g~ | g2( a) |
}


altoWords = \lyricmode {
  По тря се ни ям и пра здни кам- нет! Го ри зон там и праз дни кам- нет! Вдох но
  ве ни ям и праз дни кам нет!
}

bassWords = \lyricmode {
 Без рыбь е в зо ло той по лы~нье, ве зде сущ ность мы ши ной во зни, злы е
 cу мер ки бес смерт но го дня~
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
        \global \sopMusic
        \global \altoMusic
        \global \tenorMusic
      >>
      }
    >>
    \new Lyrics = "altos"
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
