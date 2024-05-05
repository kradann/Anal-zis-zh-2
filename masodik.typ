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
.
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

2. ha $sum(a_n)$ sor divergens, akkor (s_n) nem korlátos, így $(t_n)$ sem az. Ezért a $sum(b_n)$ sor is divergens.
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

a $sum(1/n^2)$ divergens sor esetében $abs(a_n) eq 1/n^2$, azaz $ lim_(n arrow +infinity)root(n,abs(a_n)) eq lim_(n arrow + infinity)1/(root(n,n^2)) eq 1 $

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
$ exists a_2 in {0,1,2,...,9} : alpha in [a_1/10 + a_2/10^2, a_1/10 + a_2/10^2 + 1/10^2] =: I_2 "azaz" $ $  a_1/10 + a_2/10^2 lt.eq alpha lt.eq a_2/10^2 + 1/10^2 $

Ha az eljárást folytatjuk, akkor az n-edik lépésben találon olyan $a_n in {0,1,2,...,9}$ számot, hogy

$ s_n := a_1/10 + a_2/10^2 + ... + a_n/10^n lt.eq alpha lt.eq a_1/10 + a_2/10^2 + ... + a_n/10^n + 1/10^n eq s_n + 1/10^n $,\
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
#pagebreak()
== Abszolút konvergens sorok szorzatai
#pagebreak()
== Hatványsorok konvergenciasugara
#pagebreak()
== A Cauchy-Hadamard-tétel
#pagebreak()
== Függvények határértékének egyértelműsége
#pagebreak()
== A határértékre vonatkozó átviteli elv
#pagebreak()
== Monoton függvények hatértékei
#pagebreak()
== Az összetett függvény folytonossága
#pagebreak()