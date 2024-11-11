<?php

declare(strict_types=1);

namespace Nebalus\Webapi\Action\Referral;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class ReferralDeleteAction
{
    public function __construct()
    {
    }

    public function action(Request $request, Response $response, array $args): Response
    {
        $response->getBody()->write("Referral Api Delete");

        return $response->withStatus(200);
    }
}