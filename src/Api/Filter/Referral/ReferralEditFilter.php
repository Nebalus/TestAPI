<?php

namespace Nebalus\Webapi\Api\Filter\Referral;

use Nebalus\Webapi\Api\Filter\AbstractFilter;
use Override;

class ReferralEditFilter extends AbstractFilter
{
    #[Override] public function filterAndCheckIfStructureIsValid(array $params): bool
    {
        $requiredParams = [];
        if ($this->checkIfAnyRequiredParamsAreMissing($requiredParams, $params)) {
            $this->errorMessage = 'PLACEHOLDER';
            return false;
        }

        $this->data = [];

        return true;
    }
}