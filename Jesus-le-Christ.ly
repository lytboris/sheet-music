\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

\header{
  title = "Jesus le Christ (9)"
}

global = {
  \key b \minor
  \time 4/4
  \dynamicUp
}
sopranonotes = \relative c'' {
\tag #'printonly { \partial 2 }
\tag #'midionly { s2 }
  b8 b4 fis8 | \repeat volta 2 { g4 r8 e a4 a8 e | fis4 fis \breathe d d8 d | e4 d8 e fis fis b b |
  ais2 \breathe b8 b4 fis8 | g4 r8 b8 cis4 cis8 a | fis4 fis \breathe d d | e d8 e fis4 b8 ais | }
  \alternative {{ b2 \breathe b8 b4 fis8| } { \partial 2 b2\fermata \bar "|." } }
}
sopranowords = \lyricmode { Je sus your | \repeat volta 2 { light is shin ing with | in us. Let not my | doubts and my dark ness speak to |
me. Je sus you | light is shin ing with | in us. Let my | heart al ways wel come your | } \alternative { { love. Je sus, your } { love. }} }

altonotes = \relative c' {
\tag #'printonly { \partial 2 }
\tag #'midionly { s2 }
  d8 d4 d8 | \repeat volta 2 { e4 r8 d8 cis4 b8 cis | d4 d \breathe d d8 d | cis4 b8 cis d d e e |
  fis2 \breathe d8 d4 d8 | e4 r8 d cis4 b8 cis | d4 d \breathe d d | e d8 e d4 cis8 cis | }
  \alternative { {d2 \breathe d8 d4 d8 | } { \partial 2 d2\fermata } }
}
altowords = \lyricmode {  }
tenornotes = \relative c {
\clef "G_8"
\tag #'printonly { \partial 2 }
\tag #'midionly { s2 }
  fis8 fis4 b8 | \repeat volta 2 { b4 r8 g8 e4 e8 a | a4 a \breathe b fis8 fis | a4 a8 a a b b b |
  cis2 \breathe b8 fis4 b8 | b4 r8 g e4 e8 a | a4 a \breathe b b | b b8 b b4 fis8 fis | }
  \alternative {{ fis2 \breathe fis8 fis4 b8 | } { \partial 2 fis2\fermata } }
}
tenorwords = \sopranowords
bassnotes = \relative c {
  \clef bass
\tag #'printonly { \partial 2 }
\tag #'midionly { s2 }
  b8 b4 b8 | \repeat volta 2 { e4 r8 e8 a,4 a8 a | d4 d \breathe b b8 b | a4 a8 a d d g g |
  fis2 \breathe b,8 b4 b8 | e4 r8 e a,4 a8 a | d4 d \breathe g g | g g8 g fis4 fis8 fis | }
  \alternative {{ b,2 \breathe b8 b4 b8 | }{ \partial 2 b2\fermata } }
}
basswords = \lyricmode {  }

date = #(strftime "%d-%m-%Y %H:%M" (localtime (current-time)))
  \paper {
    oddFooterMarkup = \markup {
       Compiled \date
    }
    evenFooterMarkup = \oddFooterMarkup
  }


gigaStaff = {
  \new ChoirStaff \with {midiInstrument = #"choir aahs"} <<
    \new Staff <<
      \set Staff.instrumentName = "Soprano"
      \new Voice = "soprano" <<
        \global
        \sopranonotes
        \context Lyrics = "soprano" \lyricsto "soprano" \sopranowords
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = "Alto"
      \new Voice = "alto" <<
        \global
        \altonotes
        \context Lyrics = "alto" \lyricsto "alto" \altowords
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = "Tenor"
      \new Voice = "tenor" <<
        \global
        \tenornotes
        \context Lyrics = "tenor" \lyricsto "tenor" \tenorwords
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = "Bass"
      \new Voice = "bass" <<
        \global
        \bassnotes
        \context Lyrics = "bass" \lyricsto "bass" \basswords
      >>
    >>
  >>
}

\score {
  \removeWithTag #'midionly
  {
  \gigaStaff
  }
}


\score {
  \midi { \tempo 4= 80 }
  \unfoldRepeats
  \removeWithTag #'printonly {
  \gigaStaff
  }
}
