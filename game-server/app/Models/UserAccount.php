<?php

declare(strict_types=1);

/**
 * @license Apache-2.0
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class UserAccount extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'login_token',
    ];

    protected $hidden = [
        'login_token',
    ];

    protected $casts = [
        'login_token' => 'hashed',
    ];
}
