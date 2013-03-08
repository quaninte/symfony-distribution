<?php

/**
 * This file will generate documentation for the code that is
 * in the `src` directory. It will not generate documentation
 * for anything in the vendors folder.
 *
 * @see https://github.com/fabpot/Sami
 */

use Sami\Sami;
use Symfony\Component\Finder\Finder;

$iterator = Finder::create()
    ->files()
    ->name('*.php')
    ->exclude('Resources')
    ->exclude('Tests')
    ->in(__DIR__ . '/src');

return new Sami($iterator, array(
    'title'     => 'Project API', // :EDIT: API Documentation Title
    'build_dir' => __DIR__ . '/build/doc',
    'cache_dir' => __DIR__ . '/app/cache/doc',
));

