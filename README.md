# Evolving Manifold: Genetic Algorithm for Discriminative Subspace Optimization

This repository contains MATLAB code supporting the paper:

> **Gatto, B. B., Mollinetti, M. A. F., dos Santos, E. M., Koerich, A. L., & da Silva Jr., W. S.** (2024). *A Novel Genetic Algorithm Approach for Discriminative Subspace Optimization*. In *Brazilian Conference on Intelligent Systems* (pp. 64–79). Springer.

## Abstract

> Image set representation by subspace methods has shown to be effective for tasks such as classifying images and videos. The Mutual Subspace Method (MSM), its Orthogonal extension (OMSM), and the Generalized Difference Subspace (GDS) exploit the geometric structure of data but require nonlinear optimization without closed‐form solutions. We propose a Genetic Algorithm (GA) to integrate OMSM and GDS for discriminative subspace optimization, featuring a tailored initialization and operators that ensure solution quality and feasibility. Experiments on four object‐recognition datasets demonstrate superior accuracy and highlight evolutionary algorithms for subspace learning.

## Highlights

* **Metaheuristic optimization** of subspace methods (MSM, OMSM, GDS)
* **Genetic Algorithm** with specialized initialization and genetic operators
* Evaluated on four benchmark datasets with improved classification accuracy

## Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/bernardo-gatto/Evolving_manifold.git
   cd Evolving_manifold
   ```

2. **Requirements**

   * MATLAB R2019b or later
   * Image Processing Toolbox
   * Global Optimization Toolbox (optional)

3. **Usage Example**

   ```matlab
   % Load a sample dataset (e.g., "doubutsu.mat")
   load('doubutsu.mat');  % Data variable should match script expectations

   % Run the GA-based subspace optimizer
   % Adjust parameters in GA_manifold.m as needed
   results = GA_manifold(Data);

   % Visualize similarity evolution
   plot_similarities(results);
   ```

## Key Scripts

* `GA_manifold.m`      – main GA routine for subspace optimization
* `MSM.m`             – Mutual Subspace Method implementation
* `OMSM.m`            – Orthogonal MSM extension
* `GDS_classic.m`     – Generalized Difference Subspace calculation
* `plot_similarities.m` – utility for plotting fitness and similarity matrices

*(Other supporting scripts and data files are included but not listed here.)*

## Citation

If you use this code, please cite:

```bibtex
@inproceedings{gatto2024novel,
  title={A Novel Genetic Algorithm Approach for Discriminative Subspace Optimization},
  author={Gatto, Bernardo B and Mollinetti, Marco AF and dos Santos, Eulanda M and Koerich, Alessandro L and da Silva Junior, Waldir S},
  booktitle={Brazilian Conference on Intelligent Systems},
  pages={64--79},
  year={2024},
  organization={Springer}
}
```

## License

MIT License – see [LICENSE](LICENSE) for details.
