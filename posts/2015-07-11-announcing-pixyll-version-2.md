---
layout:     post
title:      Announcing Version 2.0
date:       2015-07-11
summary:    Now, Pixyll is lighter weight and more customizable than before.
categories: jekyll pixyll
---

In an effort to make Pixyll easier to customize and more aesthetically pleasing, we've released version `2.0`.

Pixyll now features:

* Line anchors in code blocks and new syntax highlighting
* A customizable variables file
* Modular, and lighter weight CSS
* No more `max-width` media queries

```scala
object App {
  final case class Foo(arg: String) 
    extends MyClass
  type Id = List[String]
  def main(args: Array[String])(
    implicit ev: Recorder[String]
  ): Unit = {
    val first = args.map(_.toUppercase).head
    println("Hello World!")
  }
}
```

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse quis porta mauris.

However, you need to inject html if you'd like a citation footer. I will be working on a way to
hopefully sidestep this inconvenience.

<blockquote>
  <p>
    Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.
  </p>
  <footer><cite title="Antoine de Saint-Exupéry">Antoine de Saint-Exupéry</cite></footer>
</blockquote>