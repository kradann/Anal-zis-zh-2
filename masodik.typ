#import "@preview/cetz:0.2.2"

#let colorS = color.rgb("#B4D3B4")

#set page(
  paper: "a4",
  numbering: "1.",
  margin: (x: 40pt, y: 40pt)
)

#set document(
  author: "Krasznai Dániel & Tóth Zalán",
  title: "Első Analízis II. ZH kérdései"
)

#set text(
  size: 15pt,
  font: "Times New Roman"
)

#set par(justify: true)

#set enum(numbering: "1.)")

#show heading.where(level: 2): it => block(
  fill: colorS,
  inset: 10pt,
  radius: 4pt,
)[#it]

#show heading.where(level: 1): it => align(center)[#it]

#show heading.where(level: 3): it => [#underline[#it]]


= II. analízis ZH bizonyítással kért tételek
== Végtelen sorokra vonatkozó Cauchy-féle konvergenciakritérium
\
A $sum(a_n)$ sor akkor és csak akkor konvergens, ha
$ forall epsilon gt 0"-hoz" exists n_0 in NN, forall m gt n gt n_0 : abs(a_(n+1)+a_(n+2)+...+a_m) lt epsilon $

=== Bizonyítás

Tudjuk, hogy
$ sum(a_n) "konvergens" arrow.l.r.double.long (s_n) "konvergens" arrow.l.r.double.long (s_n) "Cauchy-sorozat," $

azaz

$ forall epsilon gt 0"-hoz" exists n_0 in NN, forall n,m gt n_0 : abs(s_m - s_n) lt epsilon $

teljesül. Allításunk abból következik, hogy ha $m gt n$, akkor

$ s_m - s_n = a_(n+1)+a_(n+2)+...+a_m $
#pagebreak()

== Végtelen sorokra vonatkozó összehasonlító kritériumok
\
Legyenek $sum(a_n) " és " sum(b_n)$ nemnegatív tagú sorok. Tegyük fel, hogy

$ exists N in NN, forall n gt.eq N : 0 lt.eq a_n lt.eq b_n $

Ekkor

1. #strong("Majoráns kritérium"): ha a $sum(b_n)$ sor konvergens, akkor $sum(a_n)$ sor is konvergens.
2. #strong("Minoráns kritérium"): ha a $sum(a_n)$ sor divergens, akkor $sum(b_n)$ sor is divergens

=== Bizonyítás

Az általánosság megszorítása nélkül feltehetjük, hogy $a_n lt.eq b_n$ minden
$n in NN$ esetén, hiszen véges sok tag megváltozásával egy sor konvergenciája nem változik. Jelölje $(s_n)$, illetve $(t_n)$ a $sum(a_n)$, illetve a $sum(b_n)$ sorok részletösszegeiből álló sorozatokat. A feltevésünk miatt $s_n lt.eq t_n (n in NN)$. Ekkor a nemnegatív tagú sorok konvergenciáról szóló tétel szerint

1. ha a $sum(b_n)$ sor konvergens, akkor $(t_n)$ korlátos, így $(s_n)$ is az. Ezért a $sum(a_n)$ sor is konvergens.

2. ha $sum(a_n)$ sor divergens, akkor $(s_n)$ nem korlátos, így $(t_n)$ sem az. Ezért a $sum(b_n)$ sor is divergens.
#pagebreak()

== A Cauchy-féle gyökkritérium

Tekintsük a $sum(a_n)$ végtelen sort, és tegyük fel, hogy létezik az

$ A := lim_(n arrow +infinity) root(n,abs(a_n)) in macron(RR) $

határérték. Ekkor

1. $0 lt.eq A lt 1$ esetén a $sum(a_n)$ sor abszolút konvergens (tehát konvergens is),
2. $A gt 1$ esetén a $sum(a_n)$ sor divergens
3. $A eq 1$ esetén a $sum(a_n)$ sor lehet konvergens is, divergens is

=== Bizonyítás
Mivel $root(n, abs(a_n)) gt.eq 0 (n in NN)$, ezért $A gt.eq 0$.

1. Tegyük fel, hogy $0 lt.eq A lt.eq 1$
Vegyünk egy $A$ és 1 közötti $q$ számot!

$ lim(root(n,abs(a_n))) lt q arrow.double.long exists n_0 in NN, forall n gt n_0 : root(n,abs(a_n)) lt q, "azaz" abs(a_n) lt q^n $

Mivel $0 lt q lt 1$, ezért a $sum(q^n)$ mértani sor konvergens. Így a majoráns kritérium szerint a $sum(abs(a_n))$ sor is konvegens, és ez azt jelenti, hogy a $sum(a_n)$ végtelen sor abszolút konvergens.

2. Tegyük fel, hogy $A gt 1$
Vegyünk most egy 1 és $A$ közötti $q$ számot!

$ lim(root(n, abs(a_n))) gt q arrow.r.double.long exists n_0 in NN, forall n gt n_0 : root(n, abs(a_n)) gt q, "azaz" abs(a_n) gt q^n $

Tehát, véges sok $n$ indextől eltekintve $abs(a_n) gt q^n gt 1$\
Ebből következik, hogy $lim(a_n) != 0$, és így a $sum(a_n)$ sor divergens.

3. Tegyük fel, hogy $A eq 1$. Ekkor

a $sum(1/n)$ divergens sor esetében $abs(a_n) eq 1/n$, azaz $ lim_(n arrow +infinity)root(n,abs(a_n)) eq lim_(n arrow + infinity)1/(root(n,n)) eq 1 $

a $sum(1/n^2)$ konvegens sor esetében $abs(a_n) eq 1/n^2$, azaz $ lim_(n arrow +infinity)root(n,abs(a_n)) eq lim_(n arrow + infinity)1/(root(n,n^2)) eq 1 $

#pagebreak()
== A d'Alembert-féle hányadoskritérium
\
Tegyük fel, hogy a $sum(a_n)$ végtelen sor tagjai közül egyik sem 0 és létezik az
$ A := lim_(n arrow + infinity)abs(a_(n+1)/a_n) in macron(RR) $
határérték. Ekkor\
1. $0 lt.eq A lt 1$ esetén a $sum(a_n)$ sor abszolút konvergens (tehát konvergens is),

2. $A > 1$ esetén a $sum(a_n)$ sor divergens,

3. $A eq 1$ esetén a $sum(a_n)$ sor lehet konvegens is, divergens is.

=== Bizonyítás
\
Világos, hogy $A gt.eq 0$.\
1. Legyen $0 lt.eq A lt 1$ és vegyünk egy olyan $q$ számot, amire $A lt q lt 1$ teljesül. Ekkor

$ lim_(n arrow +infinity)(abs(a_(n+1)))/(abs(a_n)) lt q arrow.double.long exists n_0 in NN, forall n gt.eq n_0 : (abs(a_(n+1)))/(abs(a_n)) lt q, "azaz" abs(a_(n+1)) lt q abs(a_n) $

Ez azt jelenti, hogy

$ abs(a_(n_0+1)) lt q abs(a_n_0), abs(a_(n_0+2)) lt q abs(a_(n_0+1)), ... , abs(a_(n-1)) lt q abs(a_(n-2)), abs(a_(n)) lt q abs(a_(n-1)) $

minden $n gt.eq n_0$ esetén. Így

$ abs(a_n) lt q abs(a_(n-1)) lt q^2 abs(a_(n-2)) lt ... lt q^(n-n_0) abs(a_n_0) eq q^(-n_0) abs(a_n_0) q^n eq a q^n $

ahol $a := q^(-n_0) abs(a_n_0)$ egy n-től független konstans. A $sum(a q^n)$ mértani sor konvergens, mert $0 lt q lt 1$. Ezért a majoráns kritérium szerint a $sum(abs(a_n))$ sor is konvergens, vagyis a $sum(a_n)$ végtelen sor abszolút konvergens.

2. Legyen $A gt 1$ és vegyünk most egy olyan $q$ számot, amire $1 lt q lt A$ teljesül. Ekkor

$ lim_(n arrow +infinity) (abs(a_(n+1)))/(abs(a_n)) gt q arrow.double.long exists n_0 in NN, forall n gt.eq n_0 : (abs(a_(n+1)))/(abs(a_n)) gt q, "azaz" abs(a_(n+1)) gt q abs(a_n) gt abs(a_n) $

Ebből következik, hogy a $lim(a_n) != 0$, így a $sum(a_n)$ sor divergens.

3. Tegyük fel, hogy $A eq 1$. Ekkor
\
$sum(1/n)$ divergens sor esetében $abs(a_n) = 1/n$, azaz $lim_(n arrow +infinity) abs(a_(n+1))/abs(a_n) eq lim_(n arrow + infinity) n/(n+1) eq 1$
\
\
$sum(1/n^2)$ konvergens sor esetében $abs(a_n) eq 1/n^2$azaz $lim_(n arrow infinity) abs(a_(n+1))/abs(a_n) eq lim_(n arrow infinity) n^2/(n+1)^2 eq 1$
#pagebreak()

== Leibniz-típusú sorok konvergenciája

=== Definíció

A $0 lt.eq a_(n+1) lt.eq a_n (n in NN^+)$ feltételt kielégítő sorozatból képzett

$ ∑_(n eq 1) (−1)^(n + 1) a_n eq a_1 − a_2 + a_3 − a_4 + dots $

váltakozó előjelű sort *Leibniz-típusú sornak* nevezzük.

*Konvergencia:* A $sum_(n eq 1) (−1)^(n + 1) a_n$ Leibniz-típusú sor akkor és csak akkor konvergens, ha $lim(a_n) eq 0$.

=== Bizonyítás

$arrow.double$) A sorok konvergenciájának szükséges feltétele értelmében, ha a $sum (−1)^(n + 1) a_n$ sor konvergens, akkor $lim((−1)^(n + 1) a_n) eq 0$, ami csak akkor lehetséges, ha $lim(a_n) eq 0$.

$arrow.double.l$) Tegyük fel, hogy $sum_(n eq 1) (−1)^(n + 1)a_n$ egy Leibniz-típusú sor, és $lim(a_n) eq 0$. Igazoljuk, hogy a sor konvergens. Legyen

$ s_n colon.eq sum_(k eq 1)^n (-1)^(k + 1) a_k eq a_1 - a_2 + a_3 - a_4 + a_5 - dots + (-1)^(n + 1) a_n space space (n in NN^+) $

Szemléltessük az $(s_n)$ részletösszeg-sorozat első néhány tagját!

#v(20pt)

#grid(
  columns: (auto, auto),
  gutter: 75pt,
  [
    #cetz.canvas({
      import cetz.draw: *

      set-style(mark: (end: "straight"))
      line((), (rel: (10, 0), update: true), name: "tengely")
      content(
        "tengely.end",
        [
          #v(25pt)
          $RR$
        ]
      )
      circle(
        ("tengely.start",1,"tengely.end"),
        radius: .1,
        name: "s2",
        fill: black,
      )
      content(
        "s2.center",
        (0,0),
        [$s_2$]
      )
      circle(
        ("tengely.start",2.47,"tengely.end"),
        radius: .1,
        name: "s4",
        fill: black,
      )
      content(
        "s4.center",
        (0,0),
        [$s_4$]
      )
      circle(
        ("tengely.start",4,"tengely.end"),
        radius: .1,
        name: "s5",
        fill: black,
      )
      content(
        "s5.center",
        (0,-1),
        padding: -.7,
        [$s_5$]
      )
      circle(
        ("tengely.start",5.75,"tengely.end"),
        radius: .1,
        name: "s3",
        fill: black,
      )
      content(
        "s3.center",
        (0,-1),
        padding: -.7,
        [$s_3$]
      )
      circle(
        ("tengely.start",7.75,"tengely.end"),
        radius: .1,
        name: "s1",
        fill: black,
      )
      content(
        "s1.center",
        (0,0),
        [$s_1 eq a_1$]
      )
      arc(
        "s2.center",
        start: -180deg,
        stop: 0deg,
        radius: 2.38,
        name: "s2tos3"
      )
      content(
        (
          name: "s2tos3",
          anchor: 50%,
        ),
        [
          #pad(top: 25pt)[
            $a_3 (lt.eq a_2)$
          ]
        ]
      )
      arc(
        "s4.center",
        start: -180deg,
        stop: 0deg,
        radius: .78,
        name: "s4tos5"
      )
        content(
        (
          name: "s4tos5",
          anchor: 50%,
        ),
        [
          #pad(top: 25pt)[
            $a_5 (lt.eq a_4)$
          ]
        ]
      )
      arc(
        "s1.center",
        start: 0deg,
        stop: 180deg,
        radius: 3.38,
        name: "s1tos2"
      )
      content(
        (
          name: "s1tos2",
          anchor: 50%,
        ),
        [
          #pad(top: -15pt)[
            $a_2 (lt.eq a_1)$
          ]
        ]
      )
      arc(
        "s3.center",
        start: 0deg,
        stop: 180deg,
        radius: 1.65,
        name: "s3tos4"
      )
      content(
        (
          name: "s3tos4",
          anchor: 50%,
        ),
        [
          #pad(top: -15pt)[
            $a_4 (lt.eq a_3)$
          ]
        ]
      )
    })
  ],
  [
    #show math.equation: set align(left)

    $ s_1 eq a_1 \
    s_2 eq a_1 - a_2 eq s_1 - a_2 \
    s_3 eq a_1 - a_2 + a_3 eq s_2 + a_3 \
    s_4 eq a_1 - a_2 + a_3 - a_4 eq s_3 - a_4 \
    s_5 eq a_1 - a_2 + a_3 - a_4 + a_5 eq s_4 + a_5 \
    $
  ]
)

Most megmutatjuk, hogy az ábra alapján sejthető tendencia valóban igaz, azaz, hogy
az $(s_(2n))$ sorozat monoton növekvő, és az $(s_(2n+1))$ sorozat monoton csökkenő.

#pagebreak()

- A páros indexű részsorozatnál a következő csoportosításból látható, hogy $ s_(2n) eq overbrace(underbrace((a_1 − a_2), gt.eq 0) + underbrace((a_3 − a_4), gt.eq 0) + dots + underbrace((a_(2n−3) − a_(2n−2)), gt.eq 0), s_(2n-2)) + underbrace((a_(2n−1) − a_(2n)), gt.eq 0) $ minden $n in NN^+$ esetén, tehát $(s_(2n))$ valóban monoton növekvő.
- Hasonlóan, a páratlan indexű részsorozatnál $ s_(2n+1) eq overbrace(a_1 + underbrace((-a_2 + a_3), lt.eq 0) + underbrace((-a_4 + a_5), lt.eq 0) + dots + underbrace((-a_(2n−2) + a_(2n−1)), lt.eq 0), s_(2n-1)) + underbrace((-a_(2n) − a_(2n+1)), lt.eq 0) $ minden $n in NN^+$ esetén, tehát $(s_(2n+1))$ monoton csökkenő sorozat.

Másrészt, az $s_0 colon.eq 0$ értelmezés mellett

$ s_(2n+1) − s_(2n) eq a_(2n+1) gt.eq 0 space space (n in NN) $

teljesül, amiből következik, hogy $s_(2n) lt.eq s_(2n+1)$ minden $n in NN$ esetén. Ekkor

$ (1) space space space s_2 lt.eq s_4 lt.eq s_6 lt.eq dots lt.eq s_(2n) lt.eq s_(2n+1) lt.eq dots lt.eq s_5 lt.eq s_3 lt.eq s_1 $

Tehát $(s_(2n))$ és $(s_(2n+1))$ korlátos sorozatok. Mivel mindkettő monoton és korlátos, ezért
konvergens is. Jelölje $A eq lim(s_(2n+1))$ és $B eq lim(s_(2n))$ a határértéküket. Ekkor

$ A - B eq lim_(n arrow + infinity) s_(2n+1) - lim_(n arrow + infinity) s_(2n) eq lim_(n arrow + infinity) (s_(2n+1) - s_(2n) ) eq lim_(n arrow + infinity) a_(2n+1) eq lim_(n arrow + infinity) a_n eq 0, $

hiszen $(a_(2n+1))$ részsorozata az $(a_n)$ sorozatnak. Ezért $A eq B$, tehát az $(s_(2n))$ és az
$(s_(2n+1))$ részsorozatok határértéke megegyezik. Ebből következik, hogy az $(s_n)$ sorozat
konvergens. Ez pedig azt jelenti, hogy a Leibniz-típusú sor valóban konvergens.

#pagebreak()
== Minden $[0,1]$-beli számok felírható tizedes tört alakban
\
Minden $alpha in [0,1]$ számhoz létezik olyan $(a_n) : NN^+ arrow {0,1,2,...,9}$ sorozat, amire az teljesül, hogy
$ alpha = sum_(n eq 1)^(+infinity) a_n/10^n $
\
=== Bizonyítás
Rögzítsünk egy $alpha in [0,1]$ számot!\
Az első lépésben osszuk fel a $[0,1]$ intervallumot 10 egyenlő hosszúságú részre. Ekkor 
$ exists a_1 in {0,1,2,...,9} : alpha in [a_1/10, a_1/10+1/10] =: I_1 "azaz " a_1/10 lt.eq alpha lt.eq a_1/10+1/10 $
\
A második lépésben osszuk fel az $I_1$ intervallumot 10 egyenlő hosszúságú részre. Ekkor
$ exists a_2 in {0,1,2,...,9} : alpha in [a_1/10 + a_2/10^2, a_1/10 + a_2/10^2 + 1/10^2] =: I_2 "azaz" $ $  a_1/10 + a_2/10^2 lt.eq alpha lt.eq a_1/10 + a_2/10^2 + 1/10^2 $

Ha az eljárást folytatjuk, akkor az n-edik lépésben találon olyan $a_n in {0,1,2,...,9}$ számot, hogy

$ s_n := a_1/10 + a_2/10^2 + ... + a_n/10^n lt.eq alpha lt.eq a_1/10 + a_2/10^2 + ... + a_n/10^n + 1/10^n eq s_n + 1/10^n , $\
ahol $s_n$ a sor n-edik részletösszege. Ekkor
$ abs(alpha - s_n) eq abs(alpha - (a_1/10 + a_2/10^2 + ... + a_n/10^n)) lt.eq 1/10^n arrow.long_(n arrow +infinity) 0 $

és így

$ alpha eq lim_(n arrow +infinity) s_n eq sum_(n eq 1)^(+infinity) a_n/10^n $
#pagebreak()
== Konvergens sorok zárójelezése
\
Egy konvergens sor minden zárójelezése is konvergens sor, és összege az eredeti sor összegével egyenlő
\
=== Bizonyítás
\
Legyen $sum_(n eq 1) alpha_n "a " sum_(n eq 1) a_n$ sor $(m_n)$ által meghatározott zárójelezése, és jelölje $(sigma_n)$ és $(s_n)$ rendre a két a sor részletösszegeiből álló sorozatok. Ha $sum_(n eq 1) a_n$ konvergens, akkor $(s_n)$ konvergens sorozat, de ekkor minden részsorozata is konvergens, és határértéke megegyezik az $(s_n)$ sorozat határértékével.\

Mivel $forall n in NN^+$ indexre $sigma_n eq s_m_n$ teljesül, így $sigma_n$ részsorozata az $(s_n)$ sorozatnak. Tehát a $(sigma_n)$ sorozat konvegens és $lim(sigma_n) eq lim(s_n)$. Ez azt jeletni, hogy a $sum(a_n)$ sor konvergens, és

$ sum_(n eq 1)^(+infinity) alpha_n eq lim_(n arrow +infinity) sigma_n eq lim_(n arrow + infinity) s_n eq sum_(n eq 1)^(+infinity) a_n $
#pagebreak()
== Abszolút konvergens sorok átrendezése

#pagebreak()
== Sorok téglányszorzatának konvergenciája
\
Tegyük fel, hogy a $sum_(n eq 0) a_n$ és a $sum_(n eq 0) b_n$ végtelen sorok konvergensek. Ekkor a $sum_(n eq 0) t_n$ téglányszorzatuk is konvergens és

$ sum_(n eq 0)^(+infinity) t_n eq sum_(n eq 0)^(+infinity) a_n dot.op sum_(n eq 0)^(+infinity) b_n $

azaz konvergens sorok téglányszorzata is konvergens, és a téglányszorzat összege a két sor összegének szorzatával egyezik meg.

=== Bizonyítás
\
A bizonyítás alapja a sorozatoknál tanult műveletek és határátmenet felcserélhetőségére vonatkozó tétel. Jelölje $A_n, B_n "és " T_n$ rendre a $sum_(n eq 0) a_n, sum_(n eq 0) b_n "és " sum_(n eq 0) t_n$ sorok n-edik részletösszegeit. Ekkor

$ T_n eq sum_(k eq 0)^n t_k eq sum_(k eq 0)^n (sum_(max{i,j} eq k) a_i b_j) eq sum_(max{i,j} lt.eq n) a_i b_j eq (sum_(i eq 0)^n a_i) dot.op (sum_(j eq 0)^n b_j) eq $
$ eq A_n B_n arrow (sum_(n eq 0)^(+infinity) a_n) dot.op (sum_(n eq 0)^(+infinity) b_n), "ha " n arrow +infinity $

Ez azt jelenti, hogy a $(T_n)$ sorozat konvergens, és így a $sum t_n$ végtelen sor is konvergens, és

$ sum_(n eq 0)^(+infinity) t_n eq lim(T_n) eq (sum_(n eq 0)^(+infinity) a_n) dot.op (sum_(n eq 0)^(+infinity) b_n) $
#pagebreak()
== Abszolút konvergens sorok szorzatai
\
Tegyük fel, hogy a $sum_(n eq 0) a_n$ és $sum_(n eq 0) b_n$ végtelen sorok mindegyike abszolút konvergens. Ekkor

1. a $sum_(n eq 0) t_n$ téglányszorzat is abszolút konvergens,

2. a $sum_(n eq 0) c_n$ Cauchy-szorzat is abszolút konvergens,

3. az összes $a_i b_j (i,j in NN)$ szorzatból tetszés szerinti sorrendben és csoportosításban képzett $sum_(n eq 0) d_n$ végtelen sor is abszolút konvergens, és

$ (\*) sum_(n eq 0)^(+infinity) d_n eq sum_(n eq 0)^(+infinity) t_n eq sum_(n eq 0)^(+infinity) c_n eq (sum_(n eq 0)^(+infinity) a_n) dot.op (sum_(n eq 0)^(+infinity) b_n) $

=== Bizonyítás
\
Elég a 3. állítást igazolni. Mivel $sum a_n$ és $sum b_n$ abszolút konvergensek, ezért

$ A_N := sum_(n eq 0)^N abs(a_n) arrow.long_(n arrow +infinity) A in RR, space B_N := sum_(n eq 0)^N abs(b_n) arrow.long_(n arrow +infinity) B in RR $

Tekintsünk egy tetszőleges $sum(d_n)$ sort, ahol $d_n eq sum a_i b_j$. Legyen $N in NN$ tetszőleges. Jelölje I, illetve J a maximális i, illetve j indexet a $d_0,d_1,...,d_N$ összegekben. Ekkor

$ sum_(n eq 0)^N abs(d_n) lt.eq sum_(0 lt.eq i lt.eq I\ 0 lt.eq j lt.eq J) abs(a_i b_j) eq (sum_(n eq 0)^I abs(a_n)) dot.op (sum_(n eq 0)^J abs(b_n)) lt.eq A dot.op B $

és ez azt jelenti, hogy a $sum abs(d_n)$ nemnegatív tagú sor konvergens, mert részletösszegei korlátosak. Tehát $sum(d_n)$ abszolút konvergens.
\
\
A fentiek érvényesek $d_n eq t_n$ esetén, így a $sum t_n$ téglányszorzat is abszolút konvergens, tehát konvergens is. Ekkor az előző tétel szerint (\*) teljesül a $sum t_n$ sorra, azaz

$ sum_(n eq 0)^(+infinity) t_n eq sum_(n eq 0)^(+infinity) a_n dot.op sum_(n eq 0)^(+infinity) b_n $

Legyen $sum t^\*_n$ az a sor, amelyet a $sum t_n$ téglányszorzatban szereplő zárójelek elhagyásával kapunk. Mivel $sum t^\*_n$ is egy lehetséges $sum d_n$ típusú sor, ezért $sum t^\*_n$ is abszolút konvergens, és így bármely zárójelezésével az összege nem változik, azaz (\*) teljesül a $sum t^\*_n$ sorra:

$ sum_(n eq 0)^(+infinity) t^\*_n eq sum_(n eq 0)^(+infinity) t_n eq sum_(n eq 0)^(+infinity) a_n dot.op sum_(n eq 0)^(+infinity) b_n $

Azonban bármely $sum d_n$ típusú sor megkapható a $sum t^\*_n$ sorból megfelelő átrendezéssel és csoportosítással. Ekkor a sor összege nem változik, tehát (\*) teljesül tetszőleges $sum d_n$ sorra.
#pagebreak()
== Hatványsorok konvergenciasugara
Tetszőleges $sum_(n eq 0) alpha_n (x-a)^n$ hatványsor konvergenciahalmazára a következő három eset egyike áll fenn:

1. $exists 0 lt R lt +infinity$, hogy a haványsor $forall x in RR : abs(x-a) lt R$ pontban abszolút konvegens és $forall x in RR : abs(x-a) gt R$ pontban divergens.

2. A hatványsor csak az $x eq a$ pontban konvergens. Ekkor legyen $R := 0$

3. A hatványsor abszolút konvergens $forall x in RR$ esetében. Ekkor legyen $R := +infinity$.

R-et a hatványsor konvergenciasugarának nevezzük.

=== Bizonyítás
Az állítás elég $a eq 0$ esetén igazolni.

==== Segédtétel
Tegyük fel, hogy a $sum alpha_n x^n$ hatványsor konvergens egy $x_0 eq.not 0$ pontban. Ekkor $forall x in RR : abs(x) lt abs(x_0)$ esetén a hatványsor abszolút konvegens az x pontban.

==== Segédtétel bizonyítása
Mivel a $sum alpha_n x_0^n$ végtelen sor konvergens, ezért $lim(a_n x_0^n) eq 0$, így az $(a_n x_0^n)$ sorozat korlátos, azaz

$ exists M gt 0 : abs(alpha_n x_0^n) lt.eq M lt +infinity space (n in NN) $

Legyen $x in RR$ olyen, amire $abs(x) lt abs(x_0)$ teljesül. Ekkor

$ abs(alpha_n x^n) eq abs(alpha_n x_0^n) dot.op abs(x/x_0)^n lt.eq M dot.op abs(x/x_0)^n =: M q^n space (n in NN) $

A $sum abs(alpha_n x^n) $ végtelen sor tehát majorálható a $sum(M q^n)$ mértani sorral, ami konvergens, mert $abs(q) eq abs(x/x_0) lt 1$. Így a majoráns kritérium szerint a $sum abs(alpha_n x^n)$ sor is konvergens, tehát a $sum(alpha_n x^n)$ végtelen sor is konvergens.

==== Tétel bizonyítása
Tekintsük a $sum alpha_n x^n$ hatványsort. Ez $x eq 0$-ban nyilván konvergens, ezért $K H(sum alpha_n x^n) eq.not emptyset$, és így

$ exists sup K H (sum_(n eq 0) alpha_n x^n) =: R in macron(RR) "és " R gt.eq 0 $

A következő három eset lehetséges

1. $0 lt R lt +infinity$. Legyen $abs(x) lt R$ tetszőleges. Ekkor a szuprémum definíciója szerint $exists x_0 gt 0 : abs(x) lt x_0 lt R$ és $x_0$ a konvergenciahalmaz eleme, azaz $sum alpha_n x_0^n$ konvergens. Ekkor a segédtétel szerint $sum alpha_n x^n$ abszolút konvergens. Ha $abs(x) gt R$ tetszőleges, akkor az R szám definíciója és a segédtétel szerint a $sum alpha_n x^n$ sor divergens.

2. $R eq 0$. A $sum alpha_n x^n$ hatványsor az $x eq 0$ pontban nyilván konvergens. Tegyük fel, hogy $x eq.not 0$ olyan pont ahol $sum alpha_n x^n$ konvergens. Ekkor a segédtétel szerint a hatványsor konvergens az $abs(x)/2 gt 0$ pontban, ami nem lehetségesm mert $R = 0$. A hatványsor tehát csak az $x eq 0$ pontban konvergens.

3. $R eq +infinity$. Legyen $x in RR$ tetszőleges. Ekkor a szuprémum definíciója értelmében $exists x_0 gt 0 : abs(x) lt x_0$ és $x_0$ a konvergenciahalmaz eleme, azaz $sum alpha_n x_0^n$ konvergens. Ekkor a segédtétel szerint $sum alpha_n x^n$ abszolút konvergens.

#pagebreak()
== A Cauchy-Hadamard-tétel
\
Tekintsük a $sum_(n eq 0) alpha_n (x-a)^n$ hatványsort, és tegyük fel, hogy

$ exists lim(root(n, abs(alpha_n))) =: A in macron(RR) $

Ekkor a hatványsor konvergenciasugara

$ R = 1/A space (1 / (+infinity) := 0, 1/0 := +infinity) $

=== Bizonyítás
\
Nyilvánvaló, hogy $A gt.eq 0$. Rögzítsük tetszőlegesen az $x in RR$ számot, és alkamazzuk a Cauchy-féle gyökkritériumot a $ sum alpha_n(x-a)^n$ végtelen számsorra:

$ lim_(n arrow +infinity) root(n, abs(alpha_n (x-a)^n)) eq (lim_(n arrow +infinity) root(n, abs(alpha_n)) dot.op abs(x-a) eq A abs(x-a), "és így" $

$ A abs(x-a) lt 1 arrow.long.double "a sor konvergens", space A abs(x-a) gt 1 arrow.long.double "a sor divergens." $

1. Ha $0 lt a lt +infinity$, akkor A-val lehet osztani, és akkor
$ x in ( a - 1/A, a+ 1/A) arrow.double.long " a sor konv.," x in.not [a - 1/A, a+ 1/A] arrow.long.double "a sor div." $

amiből következik, hogy $R eq 1/A$

2. Ha $ A eq +infinity$, akkor $forall x in RR, x != a: A abs(x-a) eq (+infinity) dot.op abs(x-a) eq +infinity gt 1$\
Ezért a hatványsor az $x eq a$ pont kivételével divergens, azaz $R eq 0$

3. Ha $A eq 0$, akkor $forall x in RR: A abs(x-a) eq 0 dot.op abs(x-a) eq  eq 0 lt 1$\
Ezért a hatványsor minden $x in RR$ pontban konvergens, azaz $R eq +infinity$
#pagebreak()
== Függvények határértékének egyértelműsége
\
Ha az $f in RR arrow.long RR$ függvénynek az $a in D^'_f$ pontban van határértéke, akkor a definícióban szereplő $A in macron(RR)$ egyértelműen létezik.

=== Bizonyítás
\
Tegyük fel, hogy két különböző $A_1, A_2 in macron(RR)$ elem eleget tesz a definíció feltételeinek. Mivel két különböző $macron(RR)$-beli elem diszjunkt környezetekkel szétválasztható ezért

$ exists epsilon gt 0 : K_epsilon (A_1) sect K_epsilon (A_2) eq emptyset $

A határérték definíciója szerint egy ilyen $epsilon$-hoz

$ exists delta_1 gt 0, forall x in K_delta_1 (a) sect D_f : f(x) in K_epsilon (A_1) $

$ exists delta_2 gt 0, forall x in K_delta_2 (a) sect D_f : f(x) in K_epsilon (A_2) $

Legyen $delta := min{delta_1, delta_2}$. Ekkor

$ forall x in K_delta (a) sect D_f : f(x) in K_epsilon (A_1) sect K_epsilon (A_2) eq emptyset, "de " K_delta (a) sect D_f != emptyset, "mert " a in D^'_f. $

Ellentmondásra jutottunk, és ezzel a határérték egyértelműségét igazoltuk.
#pagebreak()
== A határértékre vonatkozó átviteli elv
\
Legyen $f in RR arrow RR, a in D^'_f "és " A in macron(RR)$. Ekkor

$ lim_a f eq A arrow.l.r.double.long forall(x_n) : NN arrow D_f \\ {a}, lim_(n arrow +infinity) x_n eq a "esetében " lim_(n arrow +infinity) f(x_n) eq A $

=== Bizonyítás
$arrow.double.r space space lim_a f eq A arrow.double.long forall epsilon gt 0"-hoz" exists delta gt 0, forall x in K_delta (a) sect D_f : f(x) in K_epsilon (A).$

Legyen $(x_n)$ egy, a tételben szereplő sorozat, és $epsilon gt 0$ egy tetszőleges rögzített érték.

$ lim x_n eq a arrow.long.double delta"-hoz" exists n_0 in NN, forall n gt n_0 : x_n in K_delta (a) $

Mivel $x_n in D_f \\ {a}$, így $x_n in K_delta (a) sect D_f$, amiből $f(x_n) in K_epsilon (A)$ teljesül minden $n gt n_0$ indexre. Ez azt jelenti, hogy az $(f(x_n))$ sorozatnak van határértéke, és $lim_(n arrow +infinity) f(x_n) eq A$

$arrow.l.double$ Tegyük fel, hogy

$ forall(x_n) : NN arrow D_f \\ {a}, lim_(n arrow +infinity) x_n eq a "esetén " lim_(n arrow +infinity) f(x_n) eq A. $

Megmutatjuk, hogy $lim_a f = A$

Indirekt módon tegyük fel, hogy a $lim_a f = A$ egyenlőség nem igaz. Ez pontosan azt jelenti, hogy

$ exists epsilon gt 0, forall delta gt 0"-hoz" exists x_delta in K_delta (a) sect D_f : f(x_delta) in.not K_epsilon (A) $

A $delta eq 1/n (n in NN^+)$ választással ez azt jelenti, hogy

$ exists epsilon gt 0, forall n in NN^+"-hoz" exists x_n in K_(1/n) (a) sect D_f : f(x_n) in.not K_epsilon (A) $

Legyen $x_0 in D_f \\ {a}$ tetszőleges. Az $(x_n) : NN arrow D_f \\ {a}$ sorozat nyilván a-hoz tart (hiszen $x_n in K_(1/n) (a)$), de a függvényértékek $(f(x_n))$ sorozata nem tart A-hoz (hiszen $f(x_n) in.not K_epsilon (A)$), ami ellentmond a feltételünknek.
#pagebreak()
== Monoton függvények hatértékei
\
Legyen $(alpha, beta) subset RR$ tetszőleges (korlátos vagy nem korlátos) nyílt intervallum.
Ha az f függvény monoton $(alpha, beta)$-n, akkor f-nek $forall a in (alpha, beta)$ pontban létezik a jobb oldali,
illetve a bal oldali határértéke, és ezek végesek.
\
1. Ha f $arrow.tr (alpha,beta)$-n, akkor

$ lim_(a+0) f eq inf{f(x) | x in (alpha, beta), x gt a} $
$ lim_(a-0) f eq sup{f(x) | x in (alpha, beta), x lt a} $

2, Ha f $arrow.br (alpha, beta)$-n, akkor

$ lim_(a+0) f = sup{f(x) | x in (alpha, beta), x gt a} $
$ lim_(a-0) f = inf{f(x) | x in (alpha,beta), x lt a} $
=== Bizonyítás
Tegyük fel, hogy $f arrow.tr (alpha,beta)-n$. A jobb oldali határértékre vonatkozó állítást igazoljuk.
\
Legyen

$ m := inf{f(x) | x in (alpha,beta), x gt a} $

Világos, hogy $m in RR$. Az infimum definíciójából következik, hogy


1. $forall x in (alpha, beta), x gt a : m lt.eq f(x)$
2. $forall epsilon gt 0"-hoz" exists x_1 in (alpha,beta), x_1 gt a : f(x_1) lt m + epsilon$

Így $m lt.eq f(x_1) lt.eq m + epsilon$. Mivel $f arrow.tr (alpha,beta)$-n, ezért

$ m lt.eq f(x) lt.eq f(x_1) lt m + epsilon space (x in (a, x_1)) $

A $delta := x_1 - a gt 0$ választással tehát azt mutattuk meg, hogy

$ forall epsilon gt 0"-hoz" exists delta gt 0, forall x in (alpha,beta), a lt x lt a + delta : 0 lt.eq f(x) - m lt epsilon eq f(x) in K_epsilon (m) $

Ez pedig azt jelenti, hogy f-nek a-ban van jobb oldali határértéke, és az m-mel egyenlő, azaz

$ lim_(a+0) f eq m eq inf{f(x) | x in (alpha,beta), x gt a}. $

A tétel többi állítása hasonlóan bizonyítható.
#pagebreak()

== Az összetett függvény folytonossága
\
Tegyük fel, hogy $f,g in RR arrow.long RR, g in C{a} "és " f in C{g(a)}.$ Ekkor $f space circle.small space g in C{a}$, azaz az összetett föggvény örökli a belső- és a külső függvény folytonosságát.

=== Bizonyítás
\
A feltételek szerint $g(a) in D_f$, ezért $g(a) in R_g sect D_f$, azaz $R_g sect D_f != emptyset$. Így valóban beszélgetünk az $f circle.small space g$ összetett függvényről, és $a in D_(f circle.small g)$ is igaz.
\

Legyen $(x_n) : NN arrow D_(f circle.small g) subset D_g$ egy olyan sorozat, amelyre $lim(x_n) eq a$. Mivel\ $g in C{a}$, így a folytonosságra vonatkozó átviteli elv szerint $lim(g(x_n)) eq g(a)$. Jelölje

$ b := g(a) "és " y_n := g(x_n) space (n in NN) $

Ekkor $(y_n) : NN arrow D_f$ és $lim(y_n) eq b$. Mivel $f in C{b}$, így a folytonosságra vonatkozó átviteli elv szerint $lim(f(y_n)) eq f(b)$. Ugyanakkor

$ f(b) eq f(g(a)) eq (f circle.small g)(a) "és " f(y_n) eq f(g(x_n)) eq (f circle.small g)(x_n) space (n in NN) $

Azt igazoltuk tehát, hogy $forall (x_n) : NN arrow D_(f circle.small g), lim(x_n) eq a$ sorozat esetén igaz, hogy

$ lim_(n arrow +infinity) (f circle.small g)(x_n) eq lim_(x arrow +infinity) (f(y_n)) eq f(b) eq (f circle.small g)(a) $

Ezért a folytonosságra vonatkozó átviteli elv szerint $f circle.small g in C{a}$
