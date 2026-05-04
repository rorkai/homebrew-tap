# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.3.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.3.0/asc_1.3.0_macOS_arm64'
      sha256 '532dbf1f620b040e93dde343dda383e9d5c8dbc07748126e82bd4ecb45bf74dc'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.3.0/asc_1.3.0_macOS_amd64'
      sha256 'f3246d0fea695a66a79cf8c34001c5e187bcc691a96e570afc76c417cf5b4ad8'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.3.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.3.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
