test('size_hello_obj', [collect_size(5, 'size_hello_obj.o')], compile, [''])

test('size_hello_artifact', [collect_size(5, 'size_hello_artifact' + exe_extension())],
                             compile_artifact, [''])

test('size_hello_artifact_gzip', [extra_files(['./size_hello_artifact.hs']),
  collect_size(5, 'size_hello_artifact' + exe_extension() + '.gz'),
  # See Note [Makefile tests are supposed to be run in all ways] in testsuite/driver/testlib.py
  pre_cmd('$MAKE -s --no-print-directory size_hello_artifact_gzip' + ' exe_extension_from_python="' + exe_extension() + '"'), ignore_stdout, ignore_stderr],
  multimod_compile, ['size_hello_artifact', ''])

test('size_hello_unicode', [collect_size(5, 'size_hello_unicode' + exe_extension())], compile_artifact, [''])

test('size_hello_unicode_gzip', [extra_files(['./size_hello_unicode.hs']),
  collect_size(5, 'size_hello_unicode' + exe_extension() + '.gz'),
  # See Note [Makefile tests are supposed to be run in all ways] in testsuite/driver/testlib.py
  pre_cmd('$MAKE -s --no-print-directory size_hello_unicode_gzip' + ' exe_extension_from_python="' + exe_extension() + '"'), ignore_stdout, ignore_stderr],
  multimod_compile, ['size_hello_unicode', ''])

size_acceptance_threshold = 100

test('array_dir'           ,[collect_size_ghc_pkg(size_acceptance_threshold , 'array')]           , static_stats , [] )
test('base_dir'            ,[collect_size_ghc_pkg(size_acceptance_threshold , 'base')]            , static_stats , [] )
test('binary_dir'          ,[collect_size_ghc_pkg(size_acceptance_threshold , 'binary')]          , static_stats , [] )
test('bytestring_dir'      ,[collect_size_ghc_pkg(size_acceptance_threshold , 'bytestring')]      , static_stats , [] )
test('cabal_dir'           ,[collect_size_ghc_pkg(size_acceptance_threshold , 'Cabal')]           , static_stats , [] )
test('cabal_syntax_dir'    ,[collect_size_ghc_pkg(size_acceptance_threshold , 'Cabal-syntax')]    , static_stats , [] )
test('containers_dir'      ,[collect_size_ghc_pkg(size_acceptance_threshold , 'containers')]      , static_stats , [] )
test('deepseq_dir'         ,[collect_size_ghc_pkg(size_acceptance_threshold , 'deepseq')]         , static_stats , [] )
test('directory_dir'       ,[collect_size_ghc_pkg(size_acceptance_threshold , 'directory')]       , static_stats , [] )
test('exceptions_dir'      ,[collect_size_ghc_pkg(size_acceptance_threshold , 'exceptions')]      , static_stats , [] )
test('ghc_boot_dir'        ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-boot')]        , static_stats , [] )
test('ghc_boot_th_dir'     ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-boot-th')]     , static_stats , [] )
test('ghc_compact_dir'     ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-compact')]     , static_stats , [] )
test('ghc_dir'             ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc')]             , static_stats , [] )
test('ghc_experimental_dir',[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-experimental')], static_stats , [] )
test('ghc_heap_dir'        ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-heap')]        , static_stats , [] )
test('ghc_internal_dir'    ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-internal')]    , static_stats , [] )
test('ghc_platform_dir'    ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-platform')]    , static_stats , [] )
test('ghc_prim_dir'        ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-prim')]        , static_stats , [] )
test('ghc_toolchain_dir'   ,[collect_size_ghc_pkg(size_acceptance_threshold , 'ghc-toolchain')]   , static_stats , [] )
test('haskeline_dir'       ,[collect_size_ghc_pkg(size_acceptance_threshold , 'haskeline')]       , static_stats , [] )
test('hpc_dir'             ,[collect_size_ghc_pkg(size_acceptance_threshold , 'hpc')]             , static_stats , [] )
test('integer_gmp_dir'     ,[collect_size_ghc_pkg(size_acceptance_threshold , 'integer-gmp')]     , static_stats , [] )
test('mtl_dir'             ,[collect_size_ghc_pkg(size_acceptance_threshold , 'mtl')]             , static_stats , [] )
test('os_string_dir'       ,[collect_size_ghc_pkg(size_acceptance_threshold , 'os-string')]       , static_stats , [] )
test('parsec_dir'          ,[collect_size_ghc_pkg(size_acceptance_threshold , 'parsec')]          , static_stats , [] )
test('pretty_dir'          ,[collect_size_ghc_pkg(size_acceptance_threshold , 'pretty')]          , static_stats , [] )
test('process_dir'         ,[collect_size_ghc_pkg(size_acceptance_threshold , 'process')]         , static_stats , [] )
test('time_dir'            ,[collect_size_ghc_pkg(size_acceptance_threshold , 'time')]            , static_stats , [] )
test('xhtml_dir'           ,[collect_size_ghc_pkg(size_acceptance_threshold , 'xhtml')]           , static_stats , [] )

# size of the entire libdir
test('libdir'              ,[collect_size_dir(10, config.libdir)]                       , static_stats , [] )

# skip these on windows
test('unix_dir'     ,[windows_skip, collect_size_ghc_pkg(size_acceptance_threshold, 'unix')]    , static_stats, [] )
test('terminfo_dir' ,[windows_skip, js_skip, collect_size_ghc_pkg(size_acceptance_threshold, 'terminfo')], static_stats, [] )

# skip the shared object file tests on windows
test('array_so'           ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "array")]            , static_stats, [] )
test('base_so'            ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "base")]             , static_stats, [] )
test('binary_so'          ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "binary")]           , static_stats, [] )
test('bytestring_so'      ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "bytestring")]       , static_stats, [] )
test('cabal_so'           ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "Cabal")]            , static_stats, [] )
test('cabal_syntax_so'    ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "Cabal-syntax")]     , static_stats, [] )
test('containers_so'      ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "containers")]       , static_stats, [] )
test('deepseq_so'         ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "deepseq")]          , static_stats, [] )
test('directory_so'       ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "directory")]        , static_stats, [] )
test('exceptions_so'      ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "exceptions")]       , static_stats, [] )
test('filepath_so'        ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "filepath")]         , static_stats, [] )
test('ghc_boot_so'        ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghc-boot")]         , static_stats, [] )
test('ghc_boot_th_so'     ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghc-boot-th")]      , static_stats, [] )
test('ghc_experimental_so',[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghc-experimental")] , static_stats, [] )
test('ghc_heap_so'        ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghc-heap")]         , static_stats, [] )
test('ghc_platform_so'    ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghc-platform")]     , static_stats, [] )
test('ghc_prim_so'        ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghc-prim")]         , static_stats, [] )
test('ghc_so'             ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghc")]              , static_stats, [] )
test('ghc_toolchain_so'   ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghc-toolchain")]    , static_stats, [] )
test('ghci_so'            ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "ghci")]             , static_stats, [] )
test('haskeline_so'       ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "haskeline")]        , static_stats, [] )
test('hpc_so'             ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "hpc")]              , static_stats, [] )
test('mtl_so'             ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "mtl")]              , static_stats, [] )
test('os_string_so'       ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "os-string")]        , static_stats, [] )
test('parsec_so'          ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "parsec")]           , static_stats, [] )
test('process_so'         ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "process")]          , static_stats, [] )
test('rts_so'             ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "rts", True)]              , static_stats, [] )
test('template_haskell_so',[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "template-haskell")] , static_stats, [] )
# terminfo is not built in cross ghc so skip it
test('terminfo_so'        ,[req_dynamic_ghc, when(config.cross, skip), windows_skip, collect_object_size(size_acceptance_threshold, "terminfo")], static_stats, [] )
test('text_so'            ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "text")]             , static_stats, [] )
test('time_so'            ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "time")]             , static_stats, [] )
test('transformers_so'    ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "transformers")]     , static_stats, [] )
test('xhtml_so'           ,[req_dynamic_ghc, js_skip, windows_skip, collect_object_size(size_acceptance_threshold, "xhtml")]            , static_stats, [] )
