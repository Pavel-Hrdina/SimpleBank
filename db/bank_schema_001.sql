CREATE TABLE
  "accounts" (
    "id" bigserial PRIMARY KEY,
    "owner" varchar NOT NULL,
    "balance" bigint NOT NULL,
    "currency" varchar NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT 'now()'
  );

CREATE TABLE
  "entries" (
    "id" bigserial PRIMARY KEY,
    "account_id" bigint NOT NULL,
    "amout" bigint NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT 'now()'
  );

CREATE TABLE
  "transfers" (
    "id" bigserial PRIMARY KEY,
    "from_accound_id" bigint NOT NULL,
    "to_accound_id" bigint NOT NULL,
    "amout" bigint NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT 'now()'
  );

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfers" ("from_accound_id");

CREATE INDEX ON "transfers" ("to_accound_id");

CREATE INDEX ON "transfers" ("from_accound_id", "to_accound_id");

COMMENT ON COLUMN "entries"."amout" IS 'can be negative or positive';

COMMENT ON COLUMN "transfers"."amout" IS 'it must be positive';

ALTER TABLE
  "entries"
ADD
  FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE
  "transfers"
ADD
  FOREIGN KEY ("from_accound_id") REFERENCES "accounts" ("id");

ALTER TABLE
  "transfers"
ADD
  FOREIGN KEY ("to_accound_id") REFERENCES "accounts" ("id");