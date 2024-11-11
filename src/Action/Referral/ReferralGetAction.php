<?php

declare(strict_types=1);

namespace Nebalus\Webapi\Action\Referral;

use Nebalus\Webapi\Exception\ApiException;
use Nebalus\Webapi\Service\Referral\ReferralGetService;
use Nebalus\Webapi\Value\ApiResponse\ApiErrorResponse;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class ReferralGetAction
{
    private ReferralGetService $referralGetService;

    public function __construct(
        ReferralGetService $referralGetService,
    ) {
        $this->referralGetService = $referralGetService;
    }

    public function action(Request $request, Response $response, array $args): Response
    {
        try {
            // Gets Params
            if (array_key_exists("code", $args)) {
                $code = $args["code"];
            } else {
                throw new ApiException("There is no code to process", 400);
            }

            $apiResponse = $this->referralGetService->action($code);
        } catch (ApiException $e) {
            $apiResponse = ApiErrorResponse::from($e->getMessage(), $e->getCode());
        }

        $response->getBody()->write($apiResponse->getMessageAsJson());

        return $response->withStatus($apiResponse->getStatusCode());
    }
}