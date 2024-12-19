<?php

namespace Nebalus\Webapi\Api\Referral\View\Analytics;

use Nebalus\Webapi\Value\Result\Result;
use Nebalus\Webapi\Value\Result\ResultInterface;

class ReferralClickHistoryView
{
    public static function render(): ResultInterface
    {
        $fields = [];

        return Result::createSuccess("Referral history found", 200, $fields);
    }
}