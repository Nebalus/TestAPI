<?php

declare(strict_types=1);

namespace Nebalus\Webapi\Action\Linktree;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class LinktreeDeleteAction
{
    public function __construct()
    {
    }

    protected function action(Request $request, Response $response, array $args): Response
    {
        $response->getBody()->write("Linktree Api Delete");

        return $response->withStatus(200);
    }
}