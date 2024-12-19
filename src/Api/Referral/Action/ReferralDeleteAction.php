<?php

declare(strict_types=1);

namespace Nebalus\Webapi\Api\Referral\Action;

use Nebalus\Webapi\Api\AbstractAction;
use Nebalus\Webapi\Api\Referral\Service\ReferralDeleteService;
use Nebalus\Webapi\Api\Referral\Validator\ReferralDeleteValidator;
use Slim\Http\Response as Response;
use Slim\Http\ServerRequest as Request;

class ReferralDeleteAction extends AbstractAction
{
    public function __construct(
        private readonly ReferralDeleteService $service,
        private readonly ReferralDeleteValidator $validator
    ) {
    }

    protected function execute(Request $request, Response $response, array $args): Response
    {
        $this->validator->validate($request);
        $result = $this->service->execute($this->validator);
        return $response->withJson($result->getPayload(), $result->getStatusCode());
    }
}