# A Unified Experiment Design Approach for Cyclic and Acyclic Causal Models

This repository contains the implementation of the research presented in the paper titled "A Unified Experiment Design Approach for Cyclic and Acyclic Causal Models".

## Abstract
In our research, we tackle the challenges of experiment design for unique identification of the causal graph in simple Structural Causal Models (SCMs), which may include cycles. Unlike acyclic graphs, cyclic causal graphs present significant complexities as their structures cannot be easily deduced from observational distributions alone. Our proposed approach unifies the experiment design for both cyclic and acyclic graphs, providing a framework for efficiently learning these structures. We establish a lower bound on the number of experiments needed for unique identification in the worst-case scenario, demonstrating that our method is order-optimal with respect to the number of experiments, up to an additive logarithmic term. Additionally, we address constraints on the size of each experiment, proving optimality in terms of the largest experiment size required for unique identification.

## Publication
This work has been published in the Journal of Machine Learning Research (JMLR) and is also being presented at the International Conference on Learning Representations (ICLR) 2024.

- **Journal of Machine Learning Research**: [Read the paper](https://www.jmlr.org/papers/v24/22-1425.html)
- **ICLR 2024**: [Conference presentation](https://iclr.cc/virtual/2024/poster/20661)

## Citation
If you find our work useful in your research, please consider citing:

```bibtex
@article{mokhtarian2023unified,
  title={A unified experiment design approach for cyclic and acyclic causal models},
  author={Mokhtarian, Ehsan and Salehkaleybar, Saber and Ghassami, AmirEmad and Kiyavash, Negar},
  journal={Journal of Machine Learning Research},
  volume={24},
  number={354},
  pages={1--31},
  year={2023}
}
