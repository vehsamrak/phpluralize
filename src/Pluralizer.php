<?php
namespace Vehsamrak\Phpluralize;

/**
 * Russian pluralize rule applier
 * @see http://onedev.net/post/249
 */
class Pluralizer
{
    /**
     * @param $count int Number count
     * @param string $oneItem First form of word for one item (e.g. apple)
     * @param string $twoItems Second form of word for two items (e.g. apples)
     * @param string $fiveItems Third form of word for five items (e.g. apples)
     * @return string One of three forms result, according to item count
     */
    public function pluralize($count, $oneItem, $twoItems, $fiveItems)
    {
        if (
            $count % 10 >= 2
            && $count % 10 <= 4
            && ($count % 100 < 10 || $count % 100 >= 20)
        ) {
            return $count % 10 === 1 && $count % 100 !== 11
                ? $oneItem
                : $twoItems;
        }

        return $count % 10 === 1 && $count % 100 !== 11
            ? $oneItem
            : $fiveItems;
    }
}
