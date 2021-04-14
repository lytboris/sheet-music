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
  \partial 2 b8 b4 fis8 | \repeat volta 2 { g4 r8 e a4 a8 e | fis4 fis \breathe d d8 d | e4 d8 e fis fis b b |
  ais2 \breathe b8 b4 fis8 | g4 r8 b8 cis4 cis8 a | fis4 fis \breathe d d | e d8 e fis4 b8 ais | b2 \breathe b8 b4 fis8| }
}
sopranowords = \lyricmode { Je sus your | light is shin ing with | in us. Let not my | doubts adn my dark ness speak to |
me. Je sus you | light is shin ing with | in us. Let my | heart al ways wel come your | love. Je sus, your }

altonotes = \relative c' {
d8 d4 d8 | \repeat volta 2 { e4 r8 d8 cis4 b8 cis | d4 d \breathe d d8 d | cis4 b8 cis d d e e |
fis2 \breathe d8 d4 d8 | e4 r8 d cis4 b8 cis | d4 d \breathe d d | e d8 e d4 cis8 cis | d2 \breathe d8 d4 d8 | }
}
altowords = \lyricmode {  }
tenornotes = \relative c {
  \clef "G_8"
%  \clef bass
fis8 fis4 b8 | \repeat volta 2 { b4 r8 g8 e4 e8 a | a4 a \breathe b fis8 fis | a4 a8 a a b b b |
cis2 \breathe b8 fis4 b8 | b4 r8 g e4 e8 a | a4 a \breathe b b | b b8 b b4 fis8 fis | fis2 \breathe fis8 fis4 b8 | }
}
tenorwords = \sopranowords
bassnotes = \relative c {
  \clef bass
  b8 b4 b8 | \repeat volta 2 { e4 r8 e8 a,4 a8 a | d4 d \breathe b b8 b | a4 a8 a d d g g |
  fis2 \breathe b,8 b4 b8 | e4 r8 e a,4 a8 a | d4 d \breathe g g | g g8 g fis4 fis8 fis | b,2 \breathe b8 b4 b8 | }
}
basswords = \lyricmode {  }

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \sopranowords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \altowords
    >>
    \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenornotes
      >>
      \new Lyrics \lyricsto "tenor" \tenorwords
    >>
    \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \basswords
    >>
  >>
}


\score {
  \midi { \tempo 4= 80 }
  \unfoldRepeats
  \new ChoirStaff
  <<
   \new Staff = "sopranos" \with {midiInstrument = #"clarinet"} <<
      \new Voice = "sopranos" {
      <<
        \global \sopranonotes
      >>
      }
    >>
    \new Staff = "altos" \with {midiInstrument = #"clarinet"} <<
      \new Voice = "altos" {
      <<
        \global \altonotes
      >>
      }
    >>
    \new Staff = "tenors" \with {midiInstrument = #"clarinet"} <<
      \new Voice = "tenors" {
      <<
        \global \tenornotes
      >>
      }
    >>
    \new Staff = "men" \with {midiInstrument = #"cello"}  <<
      \clef bass
      \new Voice = "basses" {
        <<
          \global \bassnotes
        >>
      }
    >>
  >>
}
