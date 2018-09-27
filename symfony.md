# Symfony

## Doctrine 

### QueryBuilder

#### Subquery

```
$subQuery = $this->createQueryBuilder('a_sub')
              ->select('c.partner_data')
              ...
              ->where('a_sub = a')
              ...
              ->getQuery();
              
$query = $this->queryBuilder()
              ->select('a')
              ->addSelect("FIRST ({$subQuery->getDQL()}) as partner_data")
              ...
```

config.yml
```
# Doctrine Configuration
 doctrine:
     dbal:
         ...
     orm:
         ...
        dql:
            string_functions:
                first: App\AppBundle\DQL\FirstFunction
```

```
<?php

namespace App\AppBundle\DQL;

use Doctrine\ORM\Query\AST\Functions\FunctionNode;
use Doctrine\ORM\Query\AST\Subselect;
use Doctrine\ORM\Query\Lexer;
use Doctrine\ORM\Query\Parser;
use Doctrine\ORM\Query\SqlWalker;

/**
 * FirstFunction ::=
 *     "FIRST" "(" Subselect ")"
 */
class FirstFunction extends FunctionNode
{
    /**
     * @var Subselect
     */
    private $subselect;

    /**
     * {@inheritdoc}
     */
    public function parse(Parser $parser)
    {
        $parser->match(Lexer::T_IDENTIFIER);
        $parser->match(Lexer::T_OPEN_PARENTHESIS);
        $this->subselect = $parser->Subselect();
        $parser->match(Lexer::T_CLOSE_PARENTHESIS);
    }

    /**
     * {@inheritdoc}
     */
    public function getSql(SqlWalker $sqlWalker)
    {
        return '(' . $this->subselect->dispatch($sqlWalker) . ' LIMIT 1)';
    }
}
```

***
