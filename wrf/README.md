# WRF Benchmark

- This is a lightly modified version of the [NCAR 2019/2020 procurement WRF benchmark](https://arc.ucar.edu/knowledge_base/81887359).
  The data files and validation scripts are identical.
- Download WRFv4 and configure as desired.
  On niagara we used [v4.5.2](https://github.com/wrf-model/WRF/releases/download/v4.5.2/v4.5.2.tar.gz) [^1].
  See [configure.wrf.niagara](configure.wrf.niagara) for our configuration.
  In particular, we added `-DRSL0_ONLY` to `CFLAGS_LOCAL`.
- `./compile -j xxx em_real`
- Download and unpack the benchmark data [`scinet-lp2bm-wrf-data.tar.gz`](https://rfp2024.scinet.utoronto.ca/download.php?id=13&token=eMb5X9YuG2jLu8DDPNRPoqwBYoRNuM3P&download) [^2].
- `cd scinet-lp2bm-wrf-data/benchmark`
- Link in the `run` files from WRF:
  ```bash
  for f in "$WRF_HOME/run/"*; do
    bf=$(basename "$f")
    [[ -e $bf ]] || ln -s "$f" "$bf"
  done
  ```
- Run; we used `OMP_NUM_THREADS=1 mpirun "$WRF_HOME/main/wrf.exe"` in a SLURM job script.
- `(cd ../validation && make)` (requires gfortran).
- `python3 -m venv venv && . venv/bin/activate && pip install netCDF4`
- `../validation/validate.csh . | tee validate.output`. You should see three "thumbs up" images;
  see [validate.output.niagara](validate.output.niagara) for an example.
- The benchmark metric is the value of `Total Time:`.
- Upload the following files:
  ```
  configure.wrf
  namelist.output
  rsl.error.0000
  rsl.out.0000
  validate.output
  wrfout_d01_2019-05-05_22:00:00
  wrfout_d01_2019-05-05_22:06:00
  ```
- If you used a custom version of WRF, please upload a copy of the source, or a link if public.

[^1]: `sha256sum 408ba6aa60d9cd51d6bad2fa075a3d37000eb581b5d124162885b049c892bbdc`
[^2]: `sha256sum e3cf507e134f397da4cda394fcd4b748ed3e5682d297449edce36470929a6241`
