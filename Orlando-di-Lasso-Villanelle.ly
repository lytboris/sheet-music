\version "2.22.0"

\header {
  title = "Villanelle"
  subtitle = "(O occhi manza mia)"
  composer = "Orlando di Lasso"
}

global = {
  \key f \major
  \time 4/4
  \dynamicUp
  \accidentalStyle modern-voice-cautionary
}

sopranonotes = \relative c'' {
  \repeat volta 2 {
    \tempo "legato dolce" 4 = 120
    \mark \markup {\circle 1}
    a2 f4 f4 | g4 a4 bes2 | a4 \breathe 
    \mark \markup {\circle 2}
    a a a | bes bes a2 | f4 a a c \break c( b) c2
  }
  \set Score.doubleRepeatType = #":|.|:"
  \repeat volta 2 {
    \mark \markup {\circle 3}
    \tempo "leggiero" 4 = 140
    a4 a8 a8 fis4 fis4 | g4 g8 g8 e4 e4 | 
    \mark \markup {\circle 4}
    f4 f8 f8 g4 f4~ | f4 e8( d8) e2
  }
  \alternative {
    { f1 }
    { f1\fermata }
  }
}

altonotes = \relative c' {
  \repeat volta 2 {
    f2 c4 d4 | d4 f4 f2 | f4 \breathe f f f | f f f2 | c4 f2 e4 | g2 g2
  }
  \repeat volta 2 {
    f4 f8 f8 a4 a4 | d,4 d8 d8 g4 g4 | c,4 c8 c8 ees4 c4 | c1
  }
  \alternative {
    { c1 }
    { c1\fermata }
  }
}

tenornotes = \relative c' {
  \clef "G_8"
  \repeat volta 2 {
    c2 a4 a4 | bes4 c4 d2 | c4 \breathe c c c | d d c2 | a4 c2 c4 | d2 e2
  }
  \repeat volta 2 {
    c4 c8 c8 d4 d4 | b!4 b8 b8 c4 c4 | a4 a8 a8 bes4 a4 | g1
  }
  \alternative {
    { a1 }
    { a1\fermata }
  }
}

bassnotes = {
  \clef bass 
  \repeat volta 2 {
    f2 f4 d4 | g4 f4 bes,2 | f4 \breathe f f f | bes bes, f2 | f4 f2 a4 | g2 c2
  }
  \repeat volta 2 {
    f4 f8 f8 d4 d4 | g4 g8 g8 c4 c4 | f4 f8 f8 ees4 f4 | c1
  }
  \alternative {
    { f1 }
    { <f_\fermata f,\fermata>1 }
  }
}

mfOrP = \markup { \dynamic "mf" \bold { \italic ( } \dynamic p \bold { \italic ) } }

words_volta_one_pt_one = {
  \set stanza = \mfOrP
  \lyricmode { О, взор мо -- ей лю -- би -- мой, как лик лу -- ны ты я -- сен, }
}
words_volta_one_pt_two = \lyricmode {взор лю -- би -- мой.}
words_volta_one = \lyricmode {\words_volta_one_pt_one \words_volta_one_pt_two}

words_volta_two = {
  \set stanza = \mfOrP
  \lyricmode { Будь же счас -- тли -- вой, будь же счас -- тли -- вой, ты, мо -- я ра -- дость, }
}

words_full = \lyricmode {\repeat volta 2 { \words_volta_one } \repeat volta 2 { \words_volta_two цве }
\alternative { ток } { ток }}

sopranowords = \lyricmode {\repeat volta 2 { \words_volta_one_pt_one o, \words_volta_one_pt_two }
  \repeat volta 2 { \words_volta_two мой цве- } \alternative { ток } { ток }}
altowords = \lyricmode {\words_full}
tenorwords = \lyricmode {\words_full}
basswords = \lyricmode {\words_full}

gigaStaff = {
  \new ChoirStaff <<
    \new Staff \with {midiInstrument = #"choir aahs"} <<
      \set Staff.instrumentName = #"S."
      \new Voice = "soprano" <<
        \global
        \sopranonotes
        \context Lyrics = "soprano" \lyricsto "soprano" \sopranowords
      >>
    >>
    \new Staff \with {midiInstrument = #"choir aahs"} <<
      \set Staff.instrumentName = #"A."
      \new Voice = "alto" <<
        \global
        \altonotes
        \context Lyrics = "alto" \lyricsto "alto" \altowords
      >>
    >>
    \new Staff \with {midiInstrument = #"choir aahs"} <<
      \set Staff.instrumentName = #"T."
      \new Voice = "tenor" <<
        \global
        \tenornotes
        \context Lyrics = "tenor" \lyricsto "tenor" \tenorwords
      >>
    >>
    \new Staff \with {midiInstrument = #"choir aahs"} <<
      \set Staff.instrumentName = #"B."
      \new Voice = "bass" <<
        \global
        \bassnotes
        \context Lyrics = "bass" \lyricsto "bass" \basswords
      >>
    >>
  >>
}

\score {
\gigaStaff
}

\score {
  \midi {}
  \unfoldRepeats
  \gigaStaff
}

date = #(strftime "%d-%m-%Y %H:%M" (localtime (current-time)))
\paper {
  oddFooterMarkup = \markup {
      Compiled \date
  }
  evenFooterMarkup = \oddFooterMarkup
}
