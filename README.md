# PHP Pluralize service
Russian language pluralize rules library in PHP.

### Installation
Install the latest version with
```
composer require vehsamrak/phpluralize
```

### Usage
Pluralizer accepts four parameters:
1. number of items
2. first pluralization form (for one item).
3. second pluralization form (for two item).
4. third pluralization form (for five items).

Output will be valid pluralized string for a given number of items.

```php
<?php

use Vehsamrak\Phpluralize\Pluralizer;

$pluralizer = new Pluralizer();

$string = $pluralizer->pluralize(1, 'рубль', 'рубля', 'рублей'); // $string will be 'рубль' 
$string = $pluralizer->pluralize(2, 'рубль', 'рубля', 'рублей'); // $string will be 'рубля'
$string = $pluralizer->pluralize(5, 'рубль', 'рубля', 'рублей'); // $string will be 'рублей'
$string = $pluralizer->pluralize(21, 'рубль', 'рубля', 'рублей'); // $string will be 'рубль'  
  
```
