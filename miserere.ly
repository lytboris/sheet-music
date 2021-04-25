\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

\header {
  title = "Miserere"
  composer = "А. Лотти"
}

global = {
  \key a \minor
  \time 4/4
  \tempo Lento
  \dynamicUp
}

sopranonotes = \relative c' {
  R1*4 d2\p d2 bes'1 
  a1 g2. g4 f1  e1 a2\< a4 a4  bes2 bes2\!\>
  r4\! a4\< a4 a4 gis4. gis8\!\> gis2 r4\! g!4 g4 g4 f4. f8 f2 e1\> fis1\p\fermata
}

altonotes = \relative c' {
  R1*3 d2\p d2 a'1~\( a4 g8 fis8\) g2~\( g4 f8 e8\) f2~\( f4 e8 d8\) e2~\( 
  e4 d8 cis8\) d2~\( d4 cis8 b8\) cis2
  r4\< e4 f4 f4 e2 e2\!\> r4\! a,\< d d d4. d8\!\> d2 r4\! cis cis e e d d2 d4\(\> cis8 b8 cis2\) d1\p\fermata
}

tenornotes = \relative c {
  \clef "G_8"
  R1 d2\p d2 bes'1 a1 a2 d d e~ e d~ d a a\( gis\) a1
  r4\< cis d d cis2 cis\!\> r4\! d\< a a b4. b8\!\> b2 r4\! e e a, a4. a8 a2 a1\> a1\p\fermata
}

bassnotes = \relative c {
  \clef bass
  d2\p d2 a'1~ \(a4 g8 f8 g2~ g4 f8 e8\) f2 fis fis g e cis d b\( cis d1\) a a'2\< a4 a4 g2 g2\!\>
  r4\! f\< f f e4. e8\!\> e2 r4\! a, a a d4. d8 d2  a1\> d1\p\fermata
}

commonwords = \lyricmode { se cun dum mag nam mi se ri cor di am mi se ri cor di am}
sopranowords = \lyricmode { Mi se re re me i, De us, \commonwords tu am}
altowords = \lyricmode { Mi se re _ _ re _ _ me _ _ i, _ _ De _ _ us, \commonwords tu _ _ _ am}
tenorwords = \lyricmode {Mi se re re, Mi se re re me i, De _ us, \commonwords tu am}
basswords = \lyricmode {Mi se re _ _ _ _ _ re, Mi se re re me i, De _ _ us, \commonwords tu am}

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

