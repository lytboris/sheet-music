\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

\header{
  title = "Долгая счастливая жизнь (ГрОб)"
}

\paper {
  top-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #20
  system-system-spacing.basic-distance = #20
  last-bottom-spacing.basic-distance = #10
}

global = {
  \key c \major
  \time 4/4
}

sopMusic = \relative {
  \partial 4 d'8 e | f f f f e e e e~ | e b'\rest b2\rest d,8 e 
}

altoMusic = \relative {
  \partial 4 d'8 d | c c c c c c c b~ | b b'\rest b2\rest d,8 d
}

tenorMusic = \relative {
  \partial 4 a8 a | a a a a a a a g~ | g d\rest d2\rest a'8 a
}

bassMusic = \relative {
  \partial 4 d8 e | f f f f a a a e~ | e d\rest d2\rest d8 e
}

altoWords = \lyricmode {
  По тря се ни ям и пра здни кам- нет!
}

\score {
  \layout { }
  \midi {
    \tempo 4 = 72
  }
  \new ChoirStaff <<
    \new Staff = "women" <<
      \new Voice = "sopranos" {
        \voiceOne
        << \global \sopMusic >>
      }
      \new Voice = "altos" {
        \voiceTwo
        << \global \altoMusic >>
      }
    >>
    \new Lyrics = "altos"

    \new Staff = "men" <<
      \clef bass
      \new Voice = "tenors" {
        \voiceOne
        << \global \tenorMusic >>
      }
      \new Voice = "basses" {
        \voiceTwo << \global \bassMusic >>
      }
    >>
    \context Lyrics = "" \lyricsto "altos" \altoWords
  >>
}
