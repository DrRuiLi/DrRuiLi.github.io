---
abstract: |
  Untargeted LC-MS metabolomics offers a broad view of the microbial metabolism. However, its application is hindered by two intertwined challenges: distinguishing true biological signals from chemical artifacts and quantifying nutrient partitioning under nutrient-competitive conditions. Here, we present TRACE, an integrated experimental and computational framework that dynamically calibrates mass and retention time tolerances from the data itself to construct isotope-informed peak networks, enabling rigorous discrimination of biological metabolites from artifacts. Across four LC-MS platforms, TRACE reveals that the proportion of high-confidence annotations fell from 2.94 to 1.48%, while the total features increased by 331% from lower- to higher-sensitivity instruments. TRACE also maps nutrient fates into metabolic pathways by detecting isotopic dilution in Saccharomyces cerevisiae cultured with 13C-glucose, 15N-ammonium, and other unlabeled nutrients. Specifically, labeling of glutathione, a linear assembly of three amino acids, accurately reflect direct incorporation from its constituent amino acids; NAD+, whose biosynthesis proceeds through concurrent salvage and de novo pathways, revealed how adenine, tryptophan, and glutamine shaped its final isotopologue pattern. By converting untargeted LC-MS data into functional maps of nutrient flow, TRACE establishes a system-level approach to interrogate microbial metabolism under physiologically relevant competitive conditions.
authors:
- admin
- Junyao Wang
- Yuanhong Shan
- Zuohan Xie
- Yuzhe Xiao
- Weidong Zhuang
- Yongzhen Tao
- Jinyu Zhou
- Lifeng Yang
- Lin Wang
date: "2026-08-18T00:00:00Z"
doi: "10.1021/acs.analchem.6c02292"
featured: true
image:
  caption: Graphical abstract of TRACE
  focal_point: Smart
  preview_only: false
projects:
- TRACE
publication: '*Analytical Chemistry*'
publication_short: ""
publication_types:
- article-journal
publishDate: "2026-08-18T00:00:00Z"
summary: TRACE validates biological metabolites with 13C/15N peak networks and maps competing nutrient fate by isotopic dilution.
tags:
- Metabolomics
- MS
title: "TRACE: An Integrated Isotope-Tracing Framework for Metabolite Validation and Nutrient Fate Mapping"
url_code: https://github.com/DrRuiLi/TRACE
url_dataset: ""
url_pdf: https://doi.org/10.1021/acs.analchem.6c02292
url_poster: ""
url_project: /project/trace
url_slides: ""
url_source: ""
url_video: ""
links:
- name: Documentation
  url: https://drruili.github.io/TRACE/
  icon_pack: fas
  icon: book
---

TRACE is an integrated experimental and computational framework for untargeted LC–MS metabolomics. Fully labeled <sup>13</sup>C-glucose / <sup>15</sup>N-ammonium cultures supply high-confidence CN bundles that seed a peak–peak network; dynamic *m/z* and retention-time tolerances are learned from those seeds, then unlabeled nutrients are mapped by **isotopic dilution**.

The accompanying R package is [TRACE](https://drruili.github.io/TRACE/) (GitHub: [DrRuiLi/TRACE](https://github.com/DrRuiLi/TRACE)). A project-level overview, including workflow figures, is on the [TRACE project page](/project/trace/).

## Why a new framework

Untargeted LC–MS surveys microbial metabolism at scale, but two problems remain coupled: many detected peaks are adducts, fragments, or contaminants rather than cell-made metabolites, and classical tracing follows one labeled substrate at a time. TRACE treats isotope-confirmed peaks as network seeds, calibrates error tolerances from those seeds, and asks how cells partition competing carbon and nitrogen sources.

## Main results

- **Calibrated networks.** Complete unlabeled / <sup>15</sup>N / <sup>13</sup>C / dual-label CN bundles (Pearson ρ > 0.75) collapsed ~25,000 features to 1,098 high-confidence seeds in a representative positive-mode data set, from which data-driven *m/z* and RT tolerances are learned.
- **Better assignment than pairwise methods.** Global network assignment grouped adducts, fragments, and isotopologues of one metabolite, removed large *m/z*/RT errors seen in PAVE, and recovered missed features. About 70% of TRACE-annotated peaks matched HMDB, YMDB, KEGG, or an in-house database.
- **Sensitivity is not biology.** From Q Exactive Plus to Excedion Pro, total features rose 331% while TRACE-validated metabolites rose 117%, and the share of high-confidence annotations fell from 2.94% to 1.48%.
- **Nutrient fate under competition.** Unlabeled leucine, threonine, tryptophan, adenine, uracil, acetate, or a 14-compound mixture diluted the labeled background in a pathway-selective way. Glutathione tracked linear amino-acid assembly; NAD<sup>+</sup> revealed concurrent salvage, *de novo*, and independent nitrogen entry.

## Software versions

| Version | Role |
|---------|------|
| [`v1.0.0`](https://github.com/DrRuiLi/TRACE/releases/tag/v1.0.0) | Code used for this article |
| `main` (1.1.0+) | Ongoing development |

```r
devtools::install_github("DrRuiLi/TRACE", ref = "v1.0.0")
```
