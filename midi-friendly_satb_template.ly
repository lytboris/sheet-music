\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

\header {
  title = "Title"
  composer = "Composer"
}

global = {
  \key c \major
  \time 4/4
  \tempo Tempo
  \dynamicUp
  \accidentalStyle modern-voice-cautionary
}

sopranonotes = \relative c'' {
  b4\p\< b b b\f
}

altonotes = \relative c'' {
  g4\p g g g
}

tenornotes = \relative c {
  \clef "G_8"
  e4\mp e e e
}

bassnotes = \relative c {
  \clef bass
  c4\mf c c c
}

commonwords = \lyricmode { do do }
sopranowords = \lyricmode { re \commonwords re }
altowords = \lyricmode { mi mi \commonwords }
tenorwords = \lyricmode { \commonwords \commonwords }
basswords = \lyricmode { fa fa fa fa }

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
  \layout {
    \context {
    \Staff \RemoveEmptyStaves
    \override VerticalAxisGroup.remove-first = ##t
    }
  }
\gigaStaff
}


\score {
  \midi { \tempo 4= 80 }
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
