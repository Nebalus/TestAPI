<?php

declare(strict_types=1);

namespace Nebalus\Webapi\Controller\User;

use Nebalus\Webapi\Service\User\UserLoginService;
use Nebalus\Webapi\ValueObject\ApiResponse\ApiErrorResponse;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class UserAuthController
{
    private UserLoginService $userLoginService;

    public function __construct(UserLoginService $userLoginService)
    {
        $this->userLoginService = $userLoginService;
    }

    public function action(Request $request, Response $response, array $args): Response
    {
        $params = $request->getParsedBody();

        $responseObject = ApiErrorResponse::from("Authentication failed", 401);
    }
}
