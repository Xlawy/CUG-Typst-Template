#import "cug-template.typ": *
#import "@preview/note-me:0.2.1" as nt
#import "@preview/metalogo:1.0.2": TeX, LaTeX





#show: project.with(
  header: "这里是页眉",
  date: (
    "2024",
    "12",
    "05"
  ),
  reportName: "课程报告",
  courseName: "计算机图形学基础",
  majorName: "软件工程",
  name: "张张张",
  classNumber: "191234",
  studentID: "2022123456",
  teacher: "张张张",
  college: "计算机学院",
  coverPage: true,
  outlinePage: true,
)



= 示例

Github @CUG-Typst-Templete

== 三线表


#figure(
three-line-table(3,
  (
    [Name], [Made public], [3],
    [Typst], [2023],
    LaTeX, [1984],
    TeX
  )
),
caption: [这里是caption]
)<表格1>


== 图片

#figure(image("./Resource/logo_cug.png", width: 15%),
caption: [地大LOGO],
)<地大LOGO>

== 代码块

```python
print("Hello CUG!")
```

== note-me
#nt.note[
  Highlights information that users should take into account, even when skimming.
]
#nt.tip[
  Optional information to help a user be more successful.
]
#nt.important[
  Crucial information necessary for users to succeed.
]
#nt.warning[
  Critical content demanding immediate user attention due to potential risks.
]
#nt.caution[
  Negative potential consequences of an action.
]
#nt.todo[
  Fix `note-me` package.
]

#bibliography("ref.bib")
