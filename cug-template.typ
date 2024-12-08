#let project(
  header: "",
  date: (),
  courseName: "课程名称",
  majorName: "专业名称",
  name: "姓名",
  classNumber: "班号",
  studentID: "学号",
  teacher: "指导老师",
  college: "学院",
  coverPage: true,
  outlinePage: true,
  body
) = {

  // 字体设置
  let zh_shusong = ("FZShuSong-Z01", "FZShuSong-Z01S")
  let zh_xiaobiaosong = ("FZXiaoBiaoSong-B05", "FZXiaoBiaoSong-B05S")
  let zh_kai = ("FZKai-Z03", "FZKai-Z03S")
  let zh_hei = ("FZHei-B01", "FZHei-B01S")
  let zh_fangsong = ("FZFangSong-Z02", "FZFangSong-Z02S")
  let zh_song = ("Songti SC", "Songti TC", "SimSun")
  let en_sans_serif = "Georgia"
  let en_serif = "Times New Roman"
  let en_typewriter = "Courier New"
  let en_code = "Menlo"
  // Moidfy the following to change the font.
  let title-font = (en_serif, ..zh_hei)
  let author-font = (en_typewriter, ..zh_fangsong)
  let body-font = (en_serif, ..zh_shusong)
  let heading-font = (en_serif, ..zh_xiaobiaosong)
  let caption-font = (en_serif, ..zh_kai)
  let header-font = (en_serif, ..zh_kai)
  let strong-font = (en_serif, ..zh_hei)
  let emph-font = (en_serif, ..zh_kai)
  let raw-font = (en_code, ..zh_hei)


    // 封面
    if coverPage==true [
          #align(center)[

    #v(4em)

    #image("./Resource/logo_cug.png", width: 35%)
    #v(1em)
    #image("./Resource/name_cug.png", width: 65%)

    #v(-0.5em)
    // 课程报告
    #text(size: 40pt, tracking: 18pt, font: zh_song, weight: "semibold")[
      课程报告
    ]

    #v(-0.5em)

    #set table(
      stroke: (x, y) => if x > 1 {
        (bottom: 0.7pt + black)  
      },
    )

    #set text(size: 15pt, font: zh_song, weight: "semibold")
    #table(
      columns: (90pt, 30pt, 160pt),
      inset: 10pt,
      align: center,
      [课程名称],[：],[#courseName],
      "学        院",[：],[#college],
      [专业名称],[：],[#majorName],
      "姓        名",[：],[#name],
      "班        号",[：],[#classNumber],
      "学        号",[：],[#studentID],
      [指导老师],[：],[#teacher],
    )

    #v(1.5em)

    // 日期
    #text(size: 12pt, font: zh_song, weight: "semibold")[
      #date.at(0)年#date.at(1)月#date.at(2)日
    ]
  ]
    ]








  // 目录  
  show outline.entry.where(
    level: 1
  ):it => {
    v(12pt, weak: true)
    set text()
    strong(it)
  }

  show outline: it => {
    show heading: set align(center)
    show heading: set text(20pt)
    it
  }

  if outlinePage == true [
      #outline(title: "目录", indent: auto)
  ]



  // 设置页眉和页码
  set page(header: align(center)[ 
    #set text(font: header-font, fill: gray)
    #header
  ], footer: [
    #set align(center)
    #set text()
    #counter(page).display()
  ])

  // 从正文开始计数 
  counter(page).update(1)

  set heading(numbering: "1.1")
  set text(font: body-font, lang: "zh", region: "cn")
  set bibliography(style: "gb-7714-2015-numeric")
  
  show heading: it => box(width: 100%)[
    #v(0.50em)
    #set text(font: heading-font)
    #if it.numbering != none { counter(heading).display() }
    #h(0.75em)
    #it.body
  ]

  show heading.where(
    level: 1
  ): it => box(width: 100%)[
    #v(0.5em)
    #set align(center)
    #set heading(numbering: "一")
    #it
    #v(0.75em)
  ]


  v(2em, weak: true)

  // Main body
  set enum(indent: 2em)
  set list(indent: 2em)
  set figure(gap: 0.8cm)

  // 定义空白段，解决首段缩进问题
  let blank_par = par()[#text()[#v(0em, weak: true)];#text()[#h(0em)]]

  show figure: it => [
    #v(12pt)
    #set text(font: caption-font)
    #it
    #blank_par
    #v(12pt)
  ]

  show image: it => [
    #it
    #blank_par
  ]

  show list: it => [
    #it
    #blank_par
  ]

  show enum: it => [
    #it
    #blank_par
  ]

  show table: it => [
    #set text(font: body-font)
    #it
    #blank_par
  ]


  show strong: set text(font: strong-font)
  show emph: set text(font: emph-font)
  show ref: set text(black)
  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(240),
    inset: 10pt,
  )

  show raw.where(block: true): it => [
    #it
    #blank_par
  ]

  show raw: set text(font: raw-font)
  show link: underline
  show link: set text(blue)
  set par(first-line-indent: 2em, justify: true)


  body
}

// 三线表
#let three-line-table(column, cells) = {
  let toprule = table.hline(stroke: 0.08em)
  let bottomrule = toprule
  let midrule = table.hline(stroke: 0.05em)
  table(
    columns: column,
    align: center,
    stroke: none,
    toprule,
    table.header(..cells.slice(0, count: column)),
    midrule,
    ..cells.slice(2),
    bottomrule
  )
}

