<?php

use Sami\Sami;
use Symfony\Component\Finder\Finder;

$iterator = Finder::create()
    ->files()
    ->name('*.php')
    ->exclude('Resources')
    ->exclude('Tests')
    ->in(__DIR__ . '/src');

return new Sami($iterator, array(
    'title'     => 'Project API',
    'build_dir' => __DIR__ . '/build/doc',
    'cache_dir' => __DIR__ . '/app/cache/doc',
));

