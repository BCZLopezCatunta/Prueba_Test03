<?php

namespace Mockery\CountValidator;

use Mockery\Exception\InvalidCountException;

class Exact extends CountValidatorAbstract
{
    /**
     * Validate the call count against this validator
     *
     * @param int $n
     *
     * @throws InvalidCountException
     * @return bool
     */
    public function validate($n)
    {
        if ($this->_limit !== $n) {
            $exception = new InvalidCountException(
                'Method ' . (string) $this->_expectation
                . ' from ' . $this->_expectation->getMock()->mockery_getName()
                . ' should be called' . PHP_EOL
                . ' exactly ' . $this->_limit . ' times but called ' . $n
                . ' times.'
                . ($this->_expectation->getExceptionMessage() ? ' Because ' . $this->_expectation->getExceptionMessage() : '')
            );

            $exception->setMock($this->_expectation->getMock())
                ->setMethodName((string) $this->_expectation)
                ->setExpectedCountComparative('=')
                ->setExpectedCount($this->_limit)
                ->setActualCount($n);

            throw $exception;
        }
    }
}
