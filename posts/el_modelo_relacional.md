---
title: El modelo relacional
description: El modelo relacional. Base de datos SQL y NoSQL. Lenguajes de programación.
date: 2021-06-06
tags:
  - databases
layout: layouts/post.njk
---

"Pásame por favor el modelo de datos", ¿os suena familiar?. Si la respuesta es que sí, seguro que como yo has ido a un montón de reuniones técnicas para hablar de cómo demonios integrarse con tu sistema. El modelo de datos, el santo grial que conduce a la verdad absoluta sobre un sistema de software. Pero, ¿realmente lo es?. Sinceramente lo dudo y creo que responde más al deseo de quien pregunta de asumir algo que pueda comprender, que encaje en su modelo mental y pueda mantener sin tener que aprender nada nuevo que cuestione sus mantras y verdades absolutas.

Para empezar, ¿sobre qué modelo y sobre qué datos se nos pregunta?. Aunque no se especifique claramente, todos sabemos de qué estamos hablando: un [modelo de datos relacional](https://en.wikipedia.org/wiki/Relational_model) y operacional en [tercera forma normal](https://en.wikipedia.org/wiki/Database_normalization). Es decir, la típica sábana de tablas con relaciones que modelan entidades y (supuestamente) procesos de negocio. Hasta te puedes imaginar la arquitectura de la aplicación que trabaja con estos datos. Tres capas, con su front y back, [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) por supuesto, algún framework que lo pegue todo, en Python, C#, Java o PHP, qué más da. Se parecen todas. El código es irrelevante porque todo lo importante está en la base de datos, ¿verdad?.

La hipérbole de esta manera de pensar fueron los procesos almacenados. Los señores [Ellison](https://en.wikipedia.org/wiki/Larry_Ellison) y [Gates](https://en.wikipedia.org/wiki/Bill_Gates) nos ataron a sus [Oracle](https://en.wikipedia.org/wiki/Oracle_Database) y [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server) generando toneladas de código propietario del que todavía muchos están tratando de salir. La lógica de negocio quedaba relegada a una fina capa de código que invocaba a un [procedimiento almacenado](https://en.wikipedia.org/wiki/Stored_procedure) que se ocupaba del resto. Resto, que a la postre era lo que realmente importaba. Procedimientos que no componen por supuesto. Y cuando algo no iba bien, ponte a debuguear. Por cierto, la historia del *vendor lock-in* se sigue repitiendo disfrazada de novedad tecnológica (hola [Amazon Lambda](https://en.wikipedia.org/wiki/AWS_Lambda)). No caigais en la trampa de nuevo. Las consultoras harán el agosto y después te tocará a ti lidiar con el legacy. Mal negocio.

Pues resulta que cuando quieres escalar una aplicación entonces la base de datos, *esa* base de datos, se convierte en un problema. Para empezar, la escalabilidad horizontal pondrá tus queridas propiedades [ACID](https://en.wikipedia.org/wiki/ACID), ésas que hacen posible que tu lógica de negocio esté enterrada entre las tablas de la base de datos, contra las cuerdas. Tendrás que aprender un nuevo acrónimo, [CAP](https://en.wikipedia.org/wiki/CAP_theorem), y entender por qué te afecta y por qué tu mundo ideal en el que el código importa más bien poco se derrumba. Ponte a reaprender a programar, a replantearte muchas cosas que hacías y, para bien, a descubrir todo lo que te estabas perdiendo. Por supuesto siempre puedes escalar verticalmente pero entonces prepara la cartera, de nuevo Ellison *et al.* se pondrán muy contentos.

Por supuesto empiezan a aparecer alternativas que podrían permitirte volver a la comodidad de las garantías ACID y el modelo relacional en el mundo operacional, como [Google Spanner](https://en.wikipedia.org/wiki/Spanner_(database)), [CockroachDB](https://en.wikipedia.org/wiki/CockroachDB), [FoundationDB](https://en.wikipedia.org/wiki/FoundationDB), [FaunaDB](https://fauna.com), etc, algunas de ellas inspiradas en el *[Calvin paper](https://blog.acolyer.org/2019/03/29/calvin-fast-distributed-transactions-for-partitioned-database-systems/)*, y que explotan diversos compromisos a los que puede llegarse para superar las limitaciones que impone CAP. Mientras esto madura, el tiempo de las [Cassandras](https://en.wikipedia.org/wiki/Apache_Cassandra), [Mongos](https://en.wikipedia.org/wiki/MongoDB) y [Dynamos](https://en.wikipedia.org/wiki/Amazon_DynamoDB) continúa, lo que conocemos por [NoSQL](https://en.wikipedia.org/wiki/NoSQL). Vamos hacia una convivencia entre ambas aproximaciones, como siempre, dependiendo de tu caso de uso. Qué esperabas. No iba a ser tan fácil, ¿no?.

## Vuelta a los lenguajes de programación ##

En cualquier caso, si algo hemos aprendido por el camino es que es el momento de los lenguajes de programación. La base de datos debe ser tu capa de persistencia, nada más, ni nada menos. La lógica de negocio, lo importante, se merece la mejor herramienta que tengas para expresar sus intrincadas reglas y dependencias. Un lenguaje de programación de alto nivel y un paradigma que te permitan componer programas como piezas simples que encajan para componer otras más complejas. En mi caso, en los últimos años estas herramientas han sido [Scala](https://en.wikipedia.org/wiki/Scala_(programming_language)) y la [programación funcional](https://en.wikipedia.org/wiki/Functional_programming), pero pueden ser otras. Lo importante es no renunciar a un montón de años de investigación sobre computabilidad y lenguajes, desde [Ada Lovelace](https://en.wikipedia.org/wiki/Ada_Lovelace) a [Martin Odersky](https://en.wikipedia.org/wiki/Martin_Odersky) o [Philip Wadler](https://en.wikipedia.org/wiki/Philip_Wadler), y aprovechar la mejor herramienta a tu alcance para expresarte. El mundo no se acaba en el SQL y en Excel, lo podemos hacer mucho mejor.

¿Significa esto que debería renunciar a mi modesta pero robusta PostgreSQL?. Para nada. Si cubre tus necesidades de persistencia probablemente no haya nada mejor. Pero si el problema técnico a resolver requiere de otra cosa, tampoco le des martillazos a la pobre [PostgreSQL](https://en.wikipedia.org/wiki/PostgreSQL) para que se parezca a lo que necesitas. Probablemente te toque remangarte y ponerte a diseñar pensando no sólo en los requerimientos funcionales sino también en los técnicos. Cuando eso ocurra, probablemente lo último que debes pensar es en qué base de datos y aproximación de persistencia vas a tomar. Piensa primero en cómo vas a resolver el problema con tu lenguaje de programación o incluso plantéate si es el adecuado para el problema a resolver, aunque no menosprecies el coste del cambio. Todo cuesta.

Últimamente cuando me piden el modelo de datos suelo responder que mi sistema tiene unos cuantos, ¿a cuál te refieres?, ¿seguridad?, ¿algún servicio de negocio concreto?. Si tienes tiempo te explico el diseño del sistema. Es muy interesante ya verás. Y en una pizarra, física o virtual, se va explicando. Con todas sus complejidades y matices. Lo siento pero no me cabe en un Excel y mucho menos en un PowerPoint. Esto no es fácil, ya sabes.
